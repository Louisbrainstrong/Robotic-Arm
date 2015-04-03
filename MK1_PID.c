//Generates 2 PWM signals at 1200

#include <stdio.h>
#include <stdlib.h>
#include <at89lp51rd2.h>
#include <math.h>

// ~C51~ 

#define CURSOR_ON "\x1b[?25h"
#define CURSOR_OFF "\x1b[?25l"
#define CLEAR_SCREEN "\x1b[2J"
#define GOTO_YX "\x1B[%d;%dH"
#define CLR_TO_END_LINE "\x1B[K"
#define BKF_WTB "\x1B[0;30;47m"
#define FORE_BACK "\x1B[0;3%d;4%dm"
#define	COLOR_BLACK		0
#define	COLOR_WHITE		7

// The AT89lp51 soft processor clock is 22.1184 MHz 
#define CLK 22118400L
#define BAUD 115200L
#define BRG_VAL (0x100-(CLK/(32L*BAUD)))

//((1/10000Hz)=100 us)
#define BAUD 115200L
#define FREQ 10000L
#define TIMER0_RELOAD_VALUE (65536L-(CLK/(12L*FREQ)))
#define HCTL_FREQ 10000L
#define TIMER1_RELOAD_VALUE (65536L-(CLK/(12L*FREQ)))

//HCTL
#define RST1 P1_1	 //[PCB] P1_1
#define OE1 P3_6	 //[PCB] P3_6 [PROTO} P3_7
#define UD1 P3_2	 //[PCB] P3_2
#define RST2 P1_2	 //[PCB] P1_2
#define OE2 P3_7	 //[PCB] P3_7
#define UD2 P3_3	 //[PCB] P3_3
#define SEL1 P4_3
#define SEL2 P4_4	

// MCP3008
#define CE	  P1_4	 //[PCB] P1_4  [PROTO] P0_3

//Function Prototypes
void waitms (void);
void resetHCTL(int);
unsigned int decode (int);
unsigned int readBits(int);
void SPIWrite(unsigned char);
unsigned int GetADC(unsigned char);
int PIDcalculation(int);
int fivePointMovingAvg(int);

//MOTOR PWMs
#define M1 P3_4		 //[PCB] P3_4
#define M2 P3_5      //[PCB] P3_5

// PID GAIN VALUES
#define kp  1.000F //6.7334    
#define ki  0.187F //1.1851
#define kd  0.069F //0.4368
#define dT  0.00083333F
volatile int position = 1111;
volatile int linposition = 2222.2;
volatile int angSetPoint = 808;
volatile int linSetPoint = 909;
volatile int error = 0;
volatile int prevError = 0;
volatile int past5[5]; //Array of previous errors
volatile int errSum = 0;
volatile int dErr = 0;
volatile int pwm_temp = 0;


unsigned char _c51_external_startup(void)
{
	// Configure ports as a bidirectional with internal pull-ups.
	P0M0=0;	P0M1=0;
	P1M0=0;	P1M1=0;
	P2M0=0;	P2M1=0;
	P3M0=0;	P3M1=0;
	AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	P4M0=0;	P4M1=0;
    
    // Initialize the serial port and baud rate generator
    PCON|=0x80;
	SCON = 0x52;
    BDRCON=0;
    BRL=BRG_VAL;
    BDRCON=BRR|TBCK|RBCK|SPD;
    
    //Initialize Timer 1 for ISR
    TMOD=0B_0001_0001; // 0001 is 16-bit mode (Enhanced Timer 1, p77 in docs)
    //TCONB=0B_01000000; //TCONB(7) = P3_5 PWM on Timer1 and TCONB(6) = P3_4 for PWM on Timer0
    TCONB=0B_11000000; //P3_4 & P3_5 PWM ENABLED 
    
    TR0=0;
    TR0=1;
   	TR1=1;
 	
 	RL1=250;
 	RL0=250; 
 	
	RH1=128; //Pin3.5
	RH0=128; //Pin3.4
	
    return 0;
}

void main (void)
{	
	int linear_pwm, count = 0;
	int circles = 0;
	bit overflow = 0;
	
	resetHCTL(1);
	resetHCTL(2);
	
	//Reset everything
	printf( FORE_BACK, COLOR_BLACK, COLOR_WHITE );
	printf( CLEAR_SCREEN );
	printf( GOTO_YX, 1, 1 );
	printf("Motor Angle      :::");
	printf("\nLin Motor Position :::");
	printf("\nSetpoint Angle     ::: ");
	printf("\nLinear Setpoint    ::: ");
	printf("\nCircle Count       ::: ");
	
	
	/*PWM to 0 point First*/
	while(GetADC(1)<5){
		RH0 = 0;
	}
	
	while(1)
	{	
		/* STEPHANE's ANGULAR MOTOR */
		printf( GOTO_YX, 1, 22 );
		position = decode(1)/33.3333;          //HCTL1 (Sensor Resolution*4/360)*(Gear Ratio) = 6*4*500/360 = 33.333333
		printf("%i     ", position);
		
		angSetPoint = GetADC(1)/3.196;	   //Angular Pot Reading in degrees TODO: Not reading for like 20 degrees around 0, measure actual angle to ensure precision.
		printf( GOTO_YX, 2, 22 );
		printf("%i    ", angSetPoint);
		
		/* LINEAR ACTUATION MOTOR */
		circles = decode(2)/17.777777;
		
		if(overflow == 1){
			if(UD2 == 1)count++;
			else if(UD2 == 0)count--;
			overflow = 0;
		}
		
		if(circles>=3660 && circles<=3690)overflow = 1;
		
		printf( GOTO_YX, 3, 22 );
		linposition = circles; //17.777777;       //HCTL2 (Sensor Resolution*4/360)*(Gear Ratio) = 17.777777777 = 1 count per turn;
		printf("%i     ", linposition);
		
		linSetPoint = GetADC(1);	//Linear Pot Reading out of 1000
		printf( GOTO_YX, 4, 22 );
		printf("%i    ", linSetPoint);
		
		error = linSetPoint - linposition;
		
		linear_pwm = PIDcalculation(error); //WILL CHANGE WITH dT
		
		if(linSetPoint < 10)RH0=0;
		else if(linSetPoint > 1000)RH0=255;
		else RH0 = linear_pwm;
		
		printf( GOTO_YX, 5, 22 );
		printf("%i    ", count);
	}	
}

void resetHCTL (int select)
{
	if(select == 1){
		RST1 = 0; //Clear HCTL
	    waitms;
	    RST1 = 1;
	}
	else if(select == 2){
		RST2 = 0;
		waitms;
		RST2 = 1;
	}
}

int PIDcalculation (int error){
	int output;
	
	/*Control for HCTL Overflow*/
	if(error<-1700)
		error=50;
	
	/*Compute working error variables*/
	errSum += error * dT;
	dErr = (error - fivePointMovingAvg(prevError)); //Dividing by dT makes this huge
	
	/*Compute PID Output*/
	output = kp * error + ki * errSum + kd * dErr;
	
	/* Limit error */
	if(output > 128) output = 128;
	else if (output < -128) output = -127; //OVERFLOWS AT 255
	output = 128 - output;
	
	pwm_temp = output;
	
	prevError = error;
	
	//return output;
	return pwm_temp;
}

int fivePointMovingAvg (int prevError){
	int i = 0;
	int avgError, sum = 0;
	
	/* Shift Error values down, append newest to front */
	for(i=5; i>0; i--)
		past5[i] = past5[i-1];
	past5[0] = prevError;
	
	/* Calculate the average */
	for(i=6; i>0; i--)
		sum += past5[i];
	avgError = sum / 5;
	
	return avgError;
}


//         LP51B    HCTL
//---------------------------
// 5V   -  	VCC    - pin 1
// 0V   -  	GND    - pin 12 
// INDEX-  	PX.X   - pin 11
// CLK  -          - pin 3		
// SEL1 -  	P4.3   - pin 4
// SEL2 -  	P4.4   - pin 17
// OE   -  	P3.7   - pin 5
// U/D	-	P3.6   - pin 6
// RST	-	P1.1   - pin 8
// Y	-		   - pin 9
// G	-	  	   - pin 10
// D0   -	P2.0   - pin 2
// D1   -          - pin 20
// D2   -          - pin 19
// D3   -          - pin 18
// D4	-	P2.4   - pin 15
// D5	-		   - pin 14
// D6	-		   - pin 13
// D7	-	P2.7   - pin 7

//RETURN 32-BIT MEASUREMENT, read from encoder
unsigned int decode (int OE)
{
	unsigned int result = 0;
	int mult = 0;
	unsigned int temp = 0;
	unsigned int Result_lo = 0;
	unsigned int Result_2nd = 0;
	unsigned int Result_3rd = 0;
	unsigned int Result_hi = 0;
	
	if(OE==1)P3_6 = 1; //Disable OE
	else if(OE==2)P3_7 = 1; //Disable OE
	
			P4_3 = 0; //Sel1 TEST
			P4_4 = 1; //SEL2 = 1 (MSB)
			
	if(OE==1)P3_6 = 0; //Enable OE
	else if(OE==2)P3_7 = 0; //Enable OE	
	
		Result_hi = readBits(OE); // Get MSB
			P4_3 = 1; //SEL1 = 1 (2nd Byte)
			P4_4 = 1; //SEL2 = 1 (2nd Byte)
		Result_2nd  = readBits(OE);
			P4_3 = 0; //SEL1 = 0 (3rd Byte)
			P4_4 = 0; //SEL2 = 0 (3rd Byte)
		Result_3rd = readBits(OE);
			P4_3 = 1; //SEL1 = 1 (LSB)
			P4_4 = 0; //SEL2 = 0 (LSB)
		Result_lo = readBits(OE); // Get LSB
		
	if(OE==1)P3_6 = 1; //Disable OE
	else if(OE==2)P3_7 = 1; //Disable OE
	
		mult = 1;
		temp = Result_lo*mult; //Assign LSB
		result = temp;
	
		mult = mult*256; 		//Shift register up a byte
		temp = Result_3rd*mult; //Assign 3rd Byte
		result = result + temp;
		
		mult = mult*256;
		temp = Result_2nd*mult; //Assign 2nd Byte
		result = result + temp;
		
		mult = mult*256;
		temp = Result_hi*mult; //Assign MSB
		
		result = result + temp; // Final 32-bit result
	return result;
}

//READ BYTE FROM OPTICAL ENCODER
unsigned int readBits(int select)
{
	unsigned int num = 0;
	
	if(select == 1){
		num = P2_7*128 + P2_6*64 + P2_5*32 + P2_4*16 + P2_3*8 + P2_2*4 + P2_1*2 + P2_0*1;
	}
	
	else if(select == 2){
		num = P0_7*128 + P0_6*64 + P0_5*32 + P0_4*16 + P0_3*8 + P0_2*4 + P0_1*2 + P0_0*1;
	}
	
	return num;
}


void waitms (void){
_asm
mov R2, #1
L3: mov R1, #1
L2: mov R0, #184
L1: djnz R0, L1 ; 2 machine cycles-> 0.5425347us*184=100us
djnz R1, L2 ; 100us*10=1ms
djnz R2, L3 ; 1ms*25= 25ms
ret
_endasm;
}

//-------------------------------------------------------------Potentiometer + MCP3008------------------------------------------------------
//         LP51B    MCP3008
//---------------------------
// MISO  -  P1.5  -	pin 12
// SCK   -  P1.6  - pin 13		
// MOSI  -  P1.7  - pin 11		
// CE*   -  P0.3  - pin 10		
// 4.8V  -  VCC   - pins 15, 16  
// 0V    -  GND   - pins 9, 14   
// CH0   -        - pin 1
// CH1   -        - pin 2
// CH2   -        - pin 3
// CH3   -        - pin 4

void SPIWrite(unsigned char value)
{	SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	SPDAT=value;
	while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
}

// Read 10 bits from the MCP3008 ADC converter
unsigned int GetADC(unsigned char channel)
{	
	unsigned int adc;

	// initialize the SPI port to read the MCP3004 ADC attached to it.
	SPCON&=(~SPEN); // Disable SPI
	SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	SPCON|=SPEN; // Enable SPI
	
	CE=0; // Activate the MCP3004 ADC.
	SPIWrite(channel|0x18);	// Send start bit, single/diff* bit, D2, D1, and D0 bits.
	for(adc=0; adc<10; adc++); // Wait for S/H to setup
	SPIWrite(0x55); // Read bits 9 down to 4
	adc=((SPDAT&0x3f)*0x100); 					
	SPIWrite(0x55);// Read bits 3 down to 0
	CE=1; // Deactivate the MCP3004 ADC.
	adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	adc>>=4;
		
	return adc;
}