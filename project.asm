ORG 0000H
;--------------------------------
MAIN:
ACALL LCD_INIT ; initialize LCD
MOV DPTR,#MYDATA ;DPTR point to 'PASSWORD' text
ACALL SEND_DAT ;DISPLAY inital TEXT
ACALL DELAY ;GIVE DELAY OF ___ SECONDS	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ACALL READ_KEYPRESS ;
ACALL DELAY
ACALL CHECK_PASSWORD  
Stay_here:SJMP Stay_here 
;---------------------------------
LCD_INIT:MOV DPTR,#MYCOM
C1:CLR A
MOVC A,@A+DPTR
ACALL COMNWRT
ACALL  DELAY
INC DPTR
JZ DAT
SJMP C1
DAT:RET
;---------------------------------
SEND_DAT:  
CLR A
MOVC A,@A+DPTR
ACALL DATAWRT
ACALL DELAY
INC DPTR
JZ AGAIN
SJMP SEND_DAT
AGAIN: RET
;---------------------------------
DELAY: MOV R3,#50
HERE2: MOV R4,#255
HERE: DJNZ R4,HERE
DJNZ R3,HERE2
RET
;--------------------------------- 
READ_KEYPRESS:
MOV R0,#5D  ; R0 = 5
MOV R1,#160D ; R1= 160
ROTATE:ACALL KEY_SCAN
MOV @R1,A ;take the key pressed value and store at address of R1 i.e. 160
ACALL DATAWRT ; display the key on LCD
ACALL DELAY2 ; delay
INC R1
DJNZ R0,ROTATE ;repeat this process for 5 time
RET
;----------------------------------
CHECK_PASSWORD:MOV R0,#5D  ;R0 = 5
MOV R1,#160D ; R1= 160
MOV DPTR,#PASSWORD ;DPTR Point to actual PASSWORD
RPT:CLR A ; A = 0
MOVC A,@A+DPTR ; A = FIRST NUMBER OF THE ACTUAL PASSWORD
XRL A,@R1 ; XOR with the actual password
;if both the numbers are equal then A = 0;
JNZ FAIL ; jump to FAIL where we decide what will happen
INC R1
INC DPTR
DJNZ R0,RPT ;repeat this process for 5 times
ACALL LCD_INIT
MOV DPTR,#TEXT_S1
ACALL SEND_DAT ;display corret password
ACALL DELAY
SETB P2.3
CLR P2.4
SJMP GOBACK
FAIL:ACALL LCD_INIT
MOV DPTR,#TEXT_F1 
ACALL SEND_DAT ;display incorrect text
ACALL DELAY
CLR P2.3 
CLR P2.4 ; send 0 to the Driver motor
ACALL MAIN ;go to main funtion
GOBACK:RET

;--------------------------------------------------
;algorithm to check for key scan
KEY_SCAN:MOV P1,#11111111B  ;TAKE INPUT FROM PORT 1
;CHECKING FOR ROW 1 COLUMN 1
CLR P1.0  ;first row checking #11111110
JB P1.4, NEXT1 ;when 1 column is 1 then no button is pressed , check for next column
MOV A,#55D ; if above fails then 7 is pressed , A =7
RET 

NEXT1:JB P1.5,NEXT2 ; ROW 1 COULMN 2
MOV A,#56D ; A = 8
RET

NEXT2: JB P1.6,NEXT3 ; ROW 1 COLUMN 3
MOV A,#57D ; A=9 		  
RET

NEXT3: JB P1.7,NEXT4 ; ROW 1 COLUMN 4
MOV A,#47D  ; A=/ DIVIDE
RET

NEXT4:SETB P1.0 ; ROW 1 IS RESET
CLR P1.1 ;CHEKC FOR ROW 2
JB P1.4, NEXT5 ; ROW 2 COLUMN 1
MOV A,#52D ; A = 4
RET

NEXT5:JB P1.5,NEXT6 ; ROW 2 COLUMN 2
MOV A,#53D	;A = 5
RET

NEXT6: JB P1.6,NEXT7 ; ROW 2 COLUMN 3
MOV A,#54D ;A = 6
RET

NEXT7: JB P1.7,NEXT8 ; ROW 2 COLUMN 4
MOV A,#42D ; A = * 
RET

NEXT8:SETB P1.1 ;ROW IS RESET
CLR P1.2 ; CHECK FOR ROW 3
JB P1.4, NEXT9 ; ROW 3 COLUMN 1
MOV A,#49D  ;A = 1
RET

NEXT9:JB P1.5,NEXT10 ; ROW 3 COLUMN 2
MOV A,#50D ;A =2 
RET

NEXT10: JB P1.6,NEXT11 ; ROW 3 COLUMN 3
MOV A,#51D ;A = 3
RET

NEXT11: JB P1.7,NEXT12 ; ROW 3 COLUMN 4
MOV A,#45D ;A = -
RET

NEXT12:SETB P1.2 ; ROW 3 IS RESET
CLR P1.3 ; CHECK FOR ROW 4
JB P1.4, NEXT13 ; ROW 4 COLUMN 1
MOV A,#67D ; A = C
RET

NEXT13:JB P1.5,NEXT14; ROW 4 COLUMN 2
MOV A,#48D ; A = 0
RET

NEXT14: JB P1.6,NEXT15 ; ROW 4 COLUMN 3
MOV A,#61D	 ; A = '='
RET

NEXT15: JB P1.7,NEXT16; ROW 4 COLUMN 4
MOV A,#43D ; A = +
RET
NEXT16:LJMP KEY_SCAN ; again check for keys
;!!!!!!!!!!!!!!!!!!!!!!!!!!CHECK FOR SJMP OPTION
;-----------------------------------------------

COMNWRT:MOV P3,A
CLR P2.0
CLR P2.1
SETB P2.2
ACALL DELAY
CLR P2.2
RET

DATAWRT: MOV P3,A
SETB P2.0
CLR P2.1
SETB P2.2
ACALL DELAY
CLR P2.2
RET



DELAY2:	MOV R3,#250D
         MOV TMOD,#01
BACK2:   MOV TH0,#0FCH 
        MOV TL0,#018H 
        SETB TR0 
HERE5:  JNB TF0,HERE5
        CLR TR0 
        CLR TF0 
        DJNZ R3,BACK2
        RET       

CLRSCR: MOV A,#01H
ACALL COMNWRT
RET

ORG 500H
MYCOM: DB 38H,0EH,01,06,80H,0;
;initialize, display on curson blinking, clear display screen,
;shift cursor to right, move to line 1, 
MYDATA: DB "PASSWORD :",0
PASSWORD:DB 49D,50D,51D,52D,53D,0  ;PASSWORD = 1 2 3 4 5
TEXT_F1: DB "INCORRECT",0
TEXT_S1: DB "CORRECT",0
END