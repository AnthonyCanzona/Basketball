// By: Anthony Canzona and Nicholas Iafrate
// Mr.Rosen TEJ201 ISP Scoreboard
// January  17, 2018
// This Program bridges the Hardware aspect and Turing aspect together

//Connects the program to the Keyboard
#include <Keyboard.h>;
             
//Indicating the pins as variables           
int buttonSpin = 6;            
int buttonLpin = 9;
 
void setup() 
{ 
  //Indicates the pins are inputs
  pinMode(buttonLpin, INPUT_PULLUP);  
  pinMode(buttonSpin, INPUT_PULLUP);  
  
  Keyboard.begin();
}
 
void loop() 
{
  // Links the Start button to a character
  if (digitalRead(buttonSpin) == LOW) 
  {
    Keyboard.print('S');  
    delay(650);
  }   
  //Links the Limit Switch to a Character
  if (digitalRead(buttonLpin) == LOW) 
  {
    Keyboard.print('P');
    delay(650);
  }
}
