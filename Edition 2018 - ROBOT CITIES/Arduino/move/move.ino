#include <ros.h>
#include <std_msgs/Empty.h>
#include <robot2/Pose2DOrient.h>
#include <std_msgs/Int32.h>

//#include <Arduino.h>
#include <Wire.h>
//#include <SoftwareSerial.h>
#include <MeOrion.h>

const PROGMEM float diaRoue = 67;//milimeters
const PROGMEM float entraxe = 209;//milimeters
const PROGMEM float pi = 3.14;
const PROGMEM float calibForward = 0;
const PROGMEM float calibRotation = 0.90; //0.73
const PROGMEM float calibDiffRoues = 0.99 ;
const PROGMEM int distance_arret = 100;
const PROGMEM int temps_reperage = 5000;

ros::NodeHandle nh;

std_msgs::Empty callback;
robot2::Pose2DOrient currentPos;
robot2::Pose2DOrient posEstimee;
robot2::Pose2DOrient reperagePos;

bool continu = true;

ros::Publisher response("topic_move_master", &callback);
//ros::Publisher getPos_reperage("topic_move_reperage", &posEstimee);

void request_fct(const robot2::Pose2DOrient &msg)
{
  delay(50);
  GoTo(msg);
  delay(50);
  response.publish(&callback);
  delay(50);
}

void cote_fct(const std_msgs::Int32 &cote)
{
  if(cote.data == 0) //cote droit
   {
    currentPos.x = 2735;
    currentPos.y = 530;
    currentPos.theta = 90;
   }
   if(cote.data == 1) //cote gauche
   {
    currentPos.x = 283;
    currentPos.y = 540;
    currentPos.theta = 90;
   }
   delay(50);
}

void response_reperage(const robot2::Pose2DOrient &posAjustee)
{
  currentPos.x = posAjustee.x;
  currentPos.y = posAjustee.y;
  currentPos.theta = posAjustee.theta;
  continu = true;
  delay(50);
}

ros::Subscriber<robot2::Pose2DOrient> request("topic_master_move", &request_fct);
ros::Subscriber<std_msgs::Int32> cote("topic_master_cote", &cote_fct);
ros::Subscriber<robot2::Pose2DOrient> request_reperagePos("topic_reperage_move", &response_reperage);

MeEncoderMotor motor1(0x09, SLOT1);   //  Motor at slot1
MeEncoderMotor motor2(0x09, SLOT2);   //  motor at slot2
MeUltrasonicSensor ultraSensor(PORT_4);

void setup()
{
  motor1.begin();
  motor2.begin();
  motor1.runSpeed(0);//On les reset pour etre tranquille.
  motor1.reset();
  motor2.runSpeed(0);
  motor2.reset();
  
  nh.getHardware()->setBaud(57600);
  nh.initNode();
  
  nh.advertise(response);
  //nh.advertise(getPos_reperage);
  
  nh.subscribe(request);
  nh.subscribe(cote);
  nh.subscribe(request_reperagePos);
}

void loop()
{
  nh.spinOnce(); 
  delay(1);
}

float ToDegree(float value)
{
  return value * 180 / pi;
}

void GoTo(const robot2::Pose2DOrient &m)
{
  float y_final = abs(m.y - currentPos.y);
  
  float deplacement = sqrt(pow(m.x - currentPos.x , 2) + pow(m.y - currentPos.y , 2));

  float firstRot = 0;
  float finalRot = 0;
  
  if (m.x >= currentPos.x && m.y >= currentPos.y)
  {
    firstRot = 90 - ToDegree(acos(y_final/deplacement));
  }
  
  else if (m.x < currentPos.x && m.y >= currentPos.y)
  {
    firstRot = 90 + ToDegree(acos(y_final/deplacement));
  }
  
  else if (m.x < currentPos.x && m.y < currentPos.y)
  {
    firstRot = 270 - ToDegree(acos(y_final/deplacement));
  }
 
  else if (m.x >= currentPos.x && m.y < currentPos.y)
  {
    firstRot = 270 + ToDegree(acos(y_final/deplacement));
  }

  finalRot = (int)(m.theta - firstRot) % 360;
  firstRot = firstRot - currentPos.theta;

  if (firstRot > 180)
  {
    firstRot = -(360 - firstRot);
  }
  
  if (finalRot > 180)
  {
    finalRot = -(360 - finalRot);
  }

  if(firstRot != 0)
  {
      Self360(firstRot, 50);
  }

  if(deplacement != 0)
  {
    GoForward(deplacement, 50, firstRot);

    if(!continu)
    {
      delay(temps_reperage + 1000); //on attend que le reperage mette a jour la currentPos
      //GoTo(m);
    }
  }

  if(finalRot != 0)
  {
    Self360(finalRot, 50);
  }
  
  currentPos.x = m.x;
  currentPos.y = m.y;
  currentPos.theta = m.theta;
}

void GoForward(int _distance, float _speed, float firstOrient)
{
  motor1.reset();
  motor2.reset();

  float periRoue = pi * diaRoue;
  float nbTours = _distance / periRoue;

  motor1.runTurns(nbTours, _speed);
  motor2.runTurns( calibDiffRoues * (- nbTours), calibDiffRoues * _speed);

  WaitPositionForward(nbTours, _speed, firstOrient);
}

void Self360(int _angle, float _speed)
{
  motor1.reset();
  motor2.reset();
  
  float angl = 2 * pi * _angle / 360;
  float dist = angl * entraxe / 2; //distance a parcourir avec les roues
  float nbTours = calibRotation * dist / ( pi * diaRoue );
  
  motor1.runTurns( - nbTours, _speed );
  motor2.runTurns( calibDiffRoues * (- nbTours), calibDiffRoues * _speed );

  WaitPositionRotate(nbTours, _speed);
}

void WaitPositionForward(float _nbTours, float _speed, float firstOrient)
{
  int i = 0;
  
  int timer = (int)(_nbTours * 1000 * 60 / _speed);
  timer = abs(timer);
  timer = timer + 1000;
    
  while(i < timer)
  {
    nh.spinOnce();
    if(GetDistUltrason() < distance_arret)
    {
      Stop();
      float distanceEstimee = _speed * i;

      posEstimee.x = distanceEstimee * cos(firstOrient);
      posEstimee.y = distanceEstimee * sin(firstOrient);
      posEstimee.theta = firstOrient;

      //getPos_reperage.publish(&posEstimee);
      delay(50);

      continu = false;

      return;
    }
    else
    {
      delay(5);
      i = i + 5;
    }
  }
}

void WaitPositionRotate(float _nbTours, float _speed)
{
  int i = 0;
  
  int timer = (int)(_nbTours * 1000 * 60 / _speed);
  timer = abs(timer);
  timer = timer + 1000;
    
  while(i < timer)
  {
    delay(5);
    i = i + 5;
  }
}

float GetDistUltrason() //mm
{
  return ultraSensor.distanceCm() * 10;
}

void Stop()
{
  motor1.reset();
  motor2.reset();

  motor1.runSpeed(0);
  motor2.runSpeed(0);
}


