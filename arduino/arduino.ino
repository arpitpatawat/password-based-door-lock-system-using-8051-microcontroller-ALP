#define BLYNK_PRINT DebugSerial
#include <SoftwareSerial.h>
SoftwareSerial DebugSerial(2, 3); // RX, TX
#include <BlynkSimpleStream.h>
char auth[] = "Ri25KxPoXT36A9rPBjxpm0BGT4mn5u_E";
const int buttonPin = 12;     // the number of the button pin
const int ledPin =  13; 
int i = 0;
int buttonState = 0;   

void setup()
{
  DebugSerial.begin(9600);
  Serial.begin(9600);
  Blynk.begin(Serial, auth);
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
}

void loop()
{
  Blynk.run();
  buttonState = digitalRead(buttonPin);
    if (buttonState == HIGH) {
      if (i == 0)
      {
        Blynk.email("arpitpatawat2000@gmail.com", "Intruder Alert", "someone has tried to open door!. this is a Security Email.");
        digitalWrite(ledPin, HIGH);
        i = 1;
      }
        }
    else if(buttonState == LOW){
      digitalWrite(ledPin, LOW);
      i = 0;
      } 
}
