# Password based door lock system using 8051 microcontroller
## About
This project is a password based door lock system with alert system made with Assembly level programming for 8051 Micro-controller.
Please refer to this [document](https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP/blob/arpitp/documentation.pdf) for project documentation.

# The Main objective of this porjects is –
- Build a Secure Door Lock System.
- The Door should be only open when correct password is entered.
- It should be open for just a short span of intervel and automaticaly close after that.
- Owner can see how many people have entered the room so far.
- When wrong password is typed, it should not open the door and LCD should tell about number ao attempts left.
- When wrong password is typed continueously for 3 time then LCD should tell about intruder alert.
- An email to be sent to user’s e-mail address about the intruder warning.
- After the E-mail alert, owner need to decide whether to turn on lockdown and close all the doors of the house to catch the intruder or just reset the program.
- The program must not proceed without the owner’s confirmaton.
- LCD must display the status of on-going processes.
- User cannot tamper with the original password.

# Block Diagram
![image](https://user-images.githubusercontent.com/75129076/171994822-142232b1-f442-4fb1-a6bb-983341b664a2.png)
<br/>
![image](https://user-images.githubusercontent.com/75129076/171994839-ad8f5053-cb07-431d-9116-b02e1acba9e9.png)

<!-- 
![grab-landing-page](https://github.com/arpitpatawat/password-based-door-lock-system-using-microcontroller-ALP/blob/arpitp/micro%20project%20-%20Proteus%208%20Professional%20-%20Schematic%20Capture%202021-10-03%2016-44-53.gif)
 -->
# Hardware detail -
1. 8051 Micro-controller
2. 16 X 2 LCD
3. 4 X 4 KeyPad
4. BCD to 7 segment counter
5. Stepper motor
6. L293D Motor Driver
7. Buzzer
8. Arduino

# Software Detail -
-	Proteus Design suite–
Using Proteus, we have designed the circuit and simulated it.
-	BLYNK –
Using BLYNK app, we were able to control our circuit as well as send the alert mail. And it also helped us to make connection with internet for Arduino in the proteus tool.
-	GMAIL – 
 Using G-mail we were able to get the security alert mail
-	Keil micro vision
Using Keil micro vision, we wrote the assembly language programme that is afterward uploaded to 8051 microcontroller.
-	Arduino IDE
Using Arduino IDE, we programmed Arduino such that is can get input from 8051 micro controller and it can even send output to it along with the internet communication.
-	Virtual Serial Port emulator
Using VSPE, we made a connection between hardware port and virtual port (pairing) through which communication with internet was possible in proteus.
-	Command prompt
Using windows cmd, we were able to create a virtual port.

## Instructions -
1. First clone this repo onto you system using ``` git clone https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP.git```
2. you need to have [Proteus Software](https://www.labcenter.com/) , [Virtual Serial Port Emulator](http://www.eterlogic.com/Products.VSPE.html) and [BLYNK app](https://play.google.com/store/apps/details?id=cc.blynk&hl=en_IN&gl=US).
3. Open [proteus file](https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP/blob/arpitp/micro%20project.pdsprj) , sometimes by default the power value will become 0 if so then change it to 5 volt, also check the supply of buzzer(2V) and stepper motor (12V)
4. you need to upload the [hex](https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP/blob/arpitp/Objects/micro%20project.hex) file in 8051 and this [hex](https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP/blob/arpitp/arduino/arduino.ino.hex) file to arduino in the proteus.
5. Now setup BLYNK app, get the auth id and paste in [here](https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP/blob/arpitp/arduino/arduino.ino) 
6. Download and set up COMPIM and BLYNK library using this video - [link](https://www.youtube.com/watch?v=IcEmUOmZ19c) and also see this [documentation](https://github.com/arpitpatawat/password-based-door-lock-system-using-8051-microcontroller-ALP/blob/arpitp/documentation.pdf) for reference
7. Run the simulation in proteus and start the BLYNK app , and follow the procedure given in the below link 

![image](https://user-images.githubusercontent.com/75129076/171996672-993ec36b-11f1-4c26-a53d-58c54d29ed80.png)
![image](https://user-images.githubusercontent.com/75129076/171996676-b01844a0-28d4-4f30-9764-5c3cc32e8c7f.png)
![image](https://user-images.githubusercontent.com/75129076/171996722-aabe05e9-bdc7-4713-84f0-55ff0da2362d.png)
![image](https://user-images.githubusercontent.com/75129076/171996749-80dba7b7-4630-4d94-a086-0f110a64d7fe.png)



## Working - 
checkout the project at -  [Simulation link](https://drive.google.com/file/d/1znxnCfNZTRAjrPX5iGouFtq3nlnf6qwH/view?usp=sharing)
