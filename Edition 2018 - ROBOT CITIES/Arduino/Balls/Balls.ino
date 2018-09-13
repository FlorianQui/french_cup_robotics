#include <ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Empty.h>

#include <Servo.h>

const int angle_close = 30;
const int angle_open = 90;
const int timerBalls  = 2000;

ros::NodeHandle nh;

Servo myservo;

std_msgs::Empty callback;

ros::Publisher response("topic_balls_master", &callback);

void request_fct(const std_msgs::Int32 &msg)
{ 
  if(msg.data == 0)
  {
    myservo.write(angle_open);
    for(int i = 0; i < 20; i++)
    {
      delay(100);
      nh.spinOnce(); 
    }
    
    response.publish(&callback);
    delay(50);
  }
  if(msg.data == 1)
  {
    myservo.write(angle_close);
    for(int i = 0; i < 20; i++)
    {
      delay(100);
      nh.spinOnce(); 
    }
    response.publish(&callback);
    delay(50);
  }
  
}

ros::Subscriber<std_msgs::Int32> request("topic_master_balls", &request_fct);

void setup() {
  myservo.attach(9);
  myservo.write(angle_close);// attaches the servo on pin 9 to the servo object

  nh.getHardware()->setBaud(57600);
  nh.initNode();

  nh.advertise(response);
  nh.subscribe(request);
}

void loop()
{
  nh.spinOnce();
  delay(1);
}

void lacherBalls()
{
  myservo.write(angle_open);
  delay(timerBalls);
  myservo.write(angle_close);
}

void recupBalls()
{
  delay(1000);
  myservo.write(60);
  delay(1000);
  myservo.write(angle_close);
}

