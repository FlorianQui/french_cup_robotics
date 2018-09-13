/*
 * Code arduino pour codeurs incrémentaux magnétique ou optique.
 * 
 * Utilisation avec codeurs Kuebler 2400 mini
 * https://www.kuebler.com/k2014/j/fr/produkte/details/drehgeber/Inkremental//Miniatur/2400
 * ref : 05.2400.1122.1024
 * check branchements sur la datasheet en fonction de la ref
 * 
 * Codeur incrémental avec push-pull : 6 signaux délivrés
 * On n'utilise que 2 signaux ( A & B ) pour la 1ère version
 * 
 * Branchement codeur sans push-pull :
 *    - BROWN : 5V
 *    - WHITE : GND
 *    - GRAY : SIGNAL B en PIN 7 pour gauche, PIN 8 pour droit
 *    - GREEN : SIGNAL A en PIN 2 pour gauche, PIN 3 pour droit
 *    
 * 
*/

#define pinAGauche 2
#define pinBGauche 7
#define pinADroit 3
#define pinBDroit 8

//Encoder simple sans push-pull
typedef struct{
  int pinSignalA;
  int pinSignalB;

  volatile int pos;      // Position (en nombre de pas) du codeur
} EncoderSimple;

EncoderSimple *encoderGauche;
EncoderSimple *encoderDroit;
 
void setup(){
   Serial.begin(230400);

   /*
    Attention
    Les pins 2 & 3 du GPIO sont utilisés pour les interruptions. 
    Les pins correspondent à des numéros d'interruptions qui sont respectivement 0 & 1.
   */
   //Initialisation des encodeurs
   if(pinAGauche == 2) encoderGauche->pinSignalA = 0;
   if(pinAGauche == 3) encoderGauche->pinSignalA = 1;

   if(pinADroit == 2) encoderDroit->pinSignalA = 0;
   if(pinADroit == 3) encoderDroit->pinSignalA = 1;
   
   encoderGauche->pinSignalB = 7;
   encoderDroit->pinSignalB = 8;

   encoderGauche->pos = 0;
   encoderDroit->pos = 0;
   
   pinMode(encoderGauche->pinSignalB, INPUT);
   pinMode(encoderDroit->pinSignalB, INPUT);
   
   attachInterrupt(encoderGauche->pinSignalA, IncrementGauche, RISING); 
   attachInterrupt(encoderDroit->pinSignalA, IncrementDroit, RISING);
}
 
void loop(){
   delay(1); //on minimise le delay pour ne pas avoir de problème d'échantillonage

   /*
    * Si on veut print le résultat, il faut diminuer la fréquence d'échantillonage
    * ==>
    * delay(100);
    * Serial.println(encoderGauche->pos);
    * Serial.println(encoderDroit->pos);
   */
}

/*
 * Si le signal A est en front montant et que le signal B est positif => on a une rotation dans le sens négatif
 * cf site internet
*/
void IncrementGauche(){
   
   int signalA = digitalRead(encoderGauche->pinSignalA);
   int signalB = digitalRead(encoderGauche->pinSignalB);
   if (signalB == HIGH){
      --encoderGauche->pos;
   }
   else{
      ++encoderGauche->pos;
   }
}
void IncrementDroit(){
   int signalA = digitalRead(encoderDroit->pinSignalA);
   int signalB = digitalRead(encoderDroit->pinSignalB);
   if (signalB == HIGH){
      --encoderDroit->pos;
   }
   else{
      ++encoderDroit->pos;
   }
}
