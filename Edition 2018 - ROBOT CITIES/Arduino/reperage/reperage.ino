#include <Arduino.h>

#include <ros.h>
#include <robot2/Pose2DOrient.h>

// Motor steps per revolution. Most steppers are 200 steps or 1.8 degrees/step
#define MOTOR_STEPS 200
#define RPM 120

#define DIR 8
#define STEP 9
#define ENABLE 13 // optional (just delete ENABLE from everywhere if not used)

#define WIDE 10
#define TRAME 11
#define READ 10

#define READ_PIN 0
#define COLOR true

#include "DRV8825.h"
#define MODE0 10
#define MODE1 11
#define MODE2 12
DRV8825 stepper(MOTOR_STEPS, DIR, STEP, ENABLE, MODE0, MODE1, MODE2);

//Usfull Structs

struct Vect 
{
  double x;
  double y;  
};

struct ITri
{
  double aDeg1;
  double aDeg2;
  double aDeg3;
  bool vert;  
};

struct OTri
{
  double xr;
  double yr;
  double ar;  
};

//Convertion de degrès en radians
double Deg2Rad(double Deg){
  return 3.14159265359 * Deg / 180;
}
    

double Rad2Deg(double Rad){
  return Rad * 180.0 / 3.14159265359;
}
    
double angle(double x, double y){
    double a = Rad2Deg(atan2(y,x));
    int ent = floor(a);
    a = a - ent;
    return ((ent + 360) % 360) + a; // A verifier avec python
}

  
OTri triangulate(ITri params){

    // Constantes
    double center = 5 * 0.01;   //Offset balise
    double L = 3;  //Longueur table
    double l = 2;  //Largeur table

    double x1;
    double y1;
    double x2;
    double y2;
    double x3;
    double y3;
    
    if (params.vert) {
        x1 = -center;    //Position balise A
        y1 =  l - center;
        x2 = -center;    //Position balise B
        y2 = center;
        x3 = L + center;    //Position balise C
        y3 = l/2;
    }
    else {
        x1 = L + center;
        y1 = l - center;   //Position balise A
        x2 = L + center;
        y2 = center;   //Position balise B
        x3 = - center;
        y3 = l/2;    //Position balise C
    }

    double a1, a2, a3; 
    a1 = Deg2Rad(params.aDeg1);
    a2 = Deg2Rad(params.aDeg2);
    a3 = Deg2Rad(params.aDeg3);

    double x1p, y1p, x3p, y3p;
    double T12, T23, T31;
    double x12p, y12p, x23p, y23p, x31p, y31p;
    double k31p, D, xr, yr;
    double ar1, ar2, ar3;
    
    // STEP 1
    x1p = x1 - x2;
    y1p = y1 - y2;
    x3p = x3 - x2;
    y3p = y3 - y2;
    
    // STEP 2
    T12 = 1/tan(a2 - a1);
    T23 = 1/tan(a3 - a2);
    T31 = (1 - T12*T23)/(T12 + T23);
    
    // STEP 3 
    x12p = x1p + T12*y1p;
    y12p = y1p - T12*x1p;
    
    x23p = x3p - T23*y3p;
    y23p = y3p + T23*x3p;
    
    x31p = (x3p + x1p) + T31*(y3p - y1p);
    y31p = (y3p + y1p) - T31*(x3p - x1p);
    
    // STEP 4 
    k31p = x1p*x3p + y1p*y3p + T31*(x1p*y3p - x3p*y1p);
    
    // STEP 5
    D = (x12p - x23p)*(y23p - y31p) - (y12p - y23p)*(x23p - x31p);
    
    // STEP 6
    xr = x2 + (k31p * (y12p - y23p))/D;
    yr = y2 + (k31p * (x23p - x12p))/D;

    // STEP 7 
    Vect v1;
    v1.x = x1 - xr;
    v1.y = y1 - yr;
    ar1 = angle(v1.x, v1.y) - params.aDeg1; // Angle du robot par rapport à la balise 1
    int temp1 = floor(ar1);
    ar1 = (temp1 % 360) + (ar1 - temp1);
    
    Vect v2;
    v2.x = x2  - xr;
    v2.y = y2 - yr;
    ar2 = angle(v2.x, v2.y) - params.aDeg2; // Angle du robot par rapport à la balise 2
    int temp2 = floor(ar2);
    ar2 = (temp2 % 360) + (ar2 - temp2);
    
    Vect v3;
    v3.x = x3  - xr;
    v3.y = y3 - yr;
    ar3 = angle(v3.x, v3.y) - params.aDeg3; // Angle du robot par rapport à la balise 3
    int temp3 = floor(ar3);
    ar3 = (temp3 % 360) + (ar3 - temp3);
    
    OTri result ;
    result.xr = xr;
    result.yr = xr;
    result.ar = (ar1 + ar2 + ar3)/3;
    return result;
}

ITri calculateAngles(double x, double y, double ar){
    double center = 0; //Offset balise
    double L = 3; //Longueur table
    double l = 2; //Largeur table
    double x1 = -center;
    double y1 = l - center; //Position balise A
    double x2 = -center;
    double y2 = center; //Position balise B
    double x3 = L + center;
    double y3 = l/2; //Position balise C

    //vr = (0, 1) #Vecteur de direction du robot 
    double v1x = x1 - x; //Vecteur du point M à la balise 1
    double v1y = y1 - y;
    double v2x = x2 - x; //Vecteur du point M à la balise 2
    double v2y = y2 - y;
    double v3x = x3 - x; //Vecteur du point M à la balise 3
    double v3y = y3 - y;
    
    double a1 = angle(v1x, v1y) - ar;
    int ent1 = (int) a1;
    a1 = a1 - ent1;
    
    double a2 = angle(v2x, v2y) - ar;
    int ent2 = (int) a2;
    a2 = a2 - ent2;
    
    double a3 = angle(v3x, v3y) - ar;
    int ent3 = (int) a3;
    a3 = a3 - ent3;
    
    ITri result;
    result.aDeg1 = ((ent1 + 360) % 360) + a1;
    result.aDeg2 = ((ent2 + 360) % 360) + a2;
    result.aDeg3 = ((ent3 + 360) % 360) + a3;

    return result;
}

ITri triangulation(double ar, double xr, double yr){
    int stepp = 0;
    int sensorValue = 0;

    double ac = 0;
    
    ITri balises = calculateAngles(xr, yr, ar);

    ITri newBalises;
    
    double a1 = min(balises.aDeg1, min(balises.aDeg2, balises.aDeg3));
    double a3 = max(balises.aDeg1, max(balises.aDeg2, balises.aDeg3));
    double a2 = ((a1 != balises.aDeg1 && a3 != balises.aDeg1) ? balises.aDeg1 : ((a1 != balises.aDeg2 && a3 != balises.aDeg2) ? balises.aDeg2 : balises.aDeg3));
    
    Serial.print("Angles de recherche des balises : ");
    Serial.print(a1);
    Serial.print(" ");
    Serial.print(a2);
    Serial.print(" ");
    Serial.print(a3);
    Serial.print("\n");

    Serial.print("Position de la coupole : \n");
    Serial.print(ac);
    Serial.print("\n");

    //On se positionne vers la premiere balise
    stepper.rotate(a1);
    ac += a1;
    Serial.print(ac);
    Serial.print("\n");
    bool detected = false;
    int signe = 1;
    unsigned long t1 = millis();
    double count = 0;
    double largeur = WIDE;

    //tant qu'on a pas detecté la balise
    while(!detected){
      signe*=-1;
      count = 0;
      
      //premiere passe
      while(!detected && abs(count) < abs(largeur)){
        stepper.rotate(signe*1.8);
        ac += signe*1.8;
        count += 1.8;

        Serial.print(ac);
        Serial.print("\n");

        //Recherche de signal sur un angle
        t1 = millis();
        while(!detected && abs(millis() - t1)  < TRAME){
          sensorValue = 0;//analogRead(READ_PIN);
          if (sensorValue > READ){
            detected = true;
          }
        }
      }
      if (detected){
        newBalises.aDeg1 = ac;
        Serial.print("TROUVE BALISE 1");
      }
      else{
        //On reprend la position de depart
        Serial.print(ac);
        Serial.print("\n");
        Serial.print("DemiTour\n");
        stepper.rotate(-largeur*signe);
        ac += -largeur*signe;
        Serial.print(ac);
        Serial.print("\n");
        //On calcule la prochaine largeur de passe
        largeur = largeur + largeur * 0.5;
      }
    }
    

    stepper.rotate(a2 - ac);
    ac += a2 - ac;
    Serial.print(ac);
    Serial.print("\n");
    detected = false;
    signe = 1;
    count = 0;
    largeur = WIDE;

    //On se positionne vers la deuxieme balise
    //tant qu'on a pas detecté la balise
    while(!detected){
      signe*=-1;
      count = 0;
      
      //premiere passe
      while(!detected && abs(count) < abs(largeur)){
        stepper.rotate(signe*1.8);
        ac += signe*1.8;
        count += 1.8;

        Serial.print(ac);
        Serial.print("\n");

        //Recherche de signal sur un angle
        t1 = millis();
        while(!detected && abs(millis() - t1)  < TRAME){
          sensorValue = 0;//analogRead(READ_PIN);
          if (sensorValue > READ){
            detected = true;
          }
        }
      }
      if (detected){
        newBalises.aDeg2 = ac;
        Serial.print("TROUVE BALISE 1");
      }
      else{
        //On reprend la position de depart
        Serial.print(ac);
        Serial.print("\n");
        Serial.print("DemiTour\n");
        stepper.rotate(-largeur*signe);
        ac += -largeur*signe;
        Serial.print(ac);
        Serial.print("\n");
        //On calcule la prochaine largeur de passe
        largeur = largeur + largeur * 0.5;
      }
    }

    stepper.rotate(a2 - ac);
    ac += a2 - ac;
    Serial.print(ac);
    Serial.print("\n");
    detected = false;
    signe = 1;
    count = 0;
    largeur = WIDE;

    //On se positionne vers la deuxieme balise
    //tant qu'on a pas detecté la balise
    while(!detected){
      signe*=-1;
      count = 0;
      
      //premiere passe
      while(!detected && abs(count) < abs(largeur)){
        stepper.rotate(signe*1.8);
        ac += signe*1.8;
        count += 1.8;

        Serial.print(ac);
        Serial.print("\n");

        //Recherche de signal sur un angle
        t1 = millis();
        while(!detected && abs(millis() - t1)  < TRAME){
          sensorValue = 0;//analogRead(READ_PIN);
          if (sensorValue > READ){
            detected = true;
          }
        }
      }
      if (detected){
        newBalises.aDeg3 = ac;
        Serial.print("TROUVE BALISE 3");
      }
      else{
        //On reprend la position de depart
        Serial.print(ac);
        Serial.print("\n");
        Serial.print("DemiTour\n");
        stepper.rotate(-largeur*signe);
        ac += -largeur*signe;
        Serial.print(ac);
        Serial.print("\n");
        //On calcule la prochaine largeur de passe
        largeur = largeur + largeur * 0.5;
      }
    }

    //Faire le retour à la pos de départ
    stepper.rotate(-ac);
    ac = ac - ac;
    Serial.print(ac);
    Serial.print("\n");
    Serial.print("Fin\n");
    return newBalises;
}

OTri faireLaTriangulation(double ar, double xr, double yr, bool vert){
    stepper.begin(RPM);
    stepper.enable();
    Serial.print("wait\n");
    delay(2000);
    Serial.print("begin\n");
    ITri balises;
    OTri result;
    balises = triangulation(53.68, 0.91, 1.34);
    balises.vert = true;
    result = triangulate(balises);
    return result;
}

//ROS begin

ros::NodeHandle nh;

robot2::Pose2DOrient posResult;

ros::Publisher response("topic_reperage_move", &posResult);

void request_fct( const robot2::Pose2DOrient &posEstimee)
{
  OTri pos = faireLaTriangulation(posEstimee.theta, posEstimee.x, posEstimee.y, true);

  posResult.x = pos.xr;
  posResult.y = pos.yr;
  posResult.theta = pos.ar;
  
  delay(50);
  
  response.publish(&posResult);
  
  delay(50);
  
  posResult.x = 0;
  posResult.y = 0;
  posResult.theta = 0;
}

ros::Subscriber<robot2::Pose2DOrient> request("topic_move_reperage", &request_fct);

//ROS end

void setup() {
  Serial.begin(57600);
  
  nh.getHardware()->setBaud(57600);
  nh.initNode();

  nh.advertise(response);
  nh.subscribe(request);

  nh.loginfo("[REPERAGE] Arduino connectee");

  delay(100);
}

void loop()
{
  nh.spinOnce();
  delay(1);
}
