;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Fri Apr 03 14:06:33 2015
;--------------------------------------------------------
$name MK1_PID_interrupt
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _it_timer2
	public __c51_external_startup
	public _temp_pwm
	public _pwm_temp
	public _dErr
	public _errSum
	public _past5
	public _prevError
	public _error
	public _linSetPoint
	public _angSetPoint
	public _linposition
	public _position
	public _resetHCTL
	public _PIDcalculation
	public _fivePointMovingAvg
	public _decode
	public _readBits
	public _waitms
	public _SPIWrite
	public _GetADC
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_B              DATA 0xf0
_PSW            DATA 0xd0
_SP             DATA 0x81
_SPX            DATA 0xef
_DPL            DATA 0x82
_DPH            DATA 0x83
_DPLB           DATA 0xd4
_DPHB           DATA 0xd5
_PAGE           DATA 0xf6
_AX             DATA 0xe1
_BX             DATA 0xf7
_DSPR           DATA 0xe2
_FIRD           DATA 0xe3
_MACL           DATA 0xe4
_MACH           DATA 0xe5
_PCON           DATA 0x87
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa1
_CKRL           DATA 0x97
_CKCKON0        DATA 0x8f
_CKCKON1        DATA 0xaf
_CKSEL          DATA 0x85
_CLKREG         DATA 0xae
_OSCCON         DATA 0x85
_IE             DATA 0xa8
_IEN0           DATA 0xa8
_IEN1           DATA 0xb1
_IPH0           DATA 0xb7
_IP             DATA 0xb8
_IPL0           DATA 0xb8
_IPH1           DATA 0xb3
_IPL1           DATA 0xb2
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P4             DATA 0xc0
_P0M0           DATA 0xe6
_P0M1           DATA 0xe7
_P1M0           DATA 0xd6
_P1M1           DATA 0xd7
_P2M0           DATA 0xce
_P2M1           DATA 0xcf
_P3M0           DATA 0xc6
_P3M1           DATA 0xc7
_P4M0           DATA 0xbe
_P4M1           DATA 0xbf
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_BDRCON         DATA 0x9b
_BRL            DATA 0x9a
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TCONB          DATA 0x91
_TL0            DATA 0x8a
_TH0            DATA 0x8c
_TL1            DATA 0x8b
_TH1            DATA 0x8d
_RL0            DATA 0xf2
_RH0            DATA 0xf4
_RL1            DATA 0xf3
_RH1            DATA 0xf5
_WDTRST         DATA 0xa6
_WDTPRG         DATA 0xa7
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_RCAP2H         DATA 0xcb
_RCAP2L         DATA 0xca
_TH2            DATA 0xcd
_TL2            DATA 0xcc
_SPCON          DATA 0xc3
_SPSTA          DATA 0xc4
_SPDAT          DATA 0xc5
_SSCON          DATA 0x93
_SSCS           DATA 0x94
_SSDAT          DATA 0x95
_SSADR          DATA 0x96
_KBLS           DATA 0x9c
_KBE            DATA 0x9d
_KBF            DATA 0x9e
_KBMOD          DATA 0x9f
_BMSEL          DATA 0x92
_FCON           DATA 0xd2
_EECON          DATA 0xd2
_ACSRA          DATA 0xa3
_ACSRB          DATA 0xab
_AREF           DATA 0xbd
_DADC           DATA 0xa4
_DADI           DATA 0xa5
_DADL           DATA 0xac
_DADH           DATA 0xad
_CCON           DATA 0xd8
_CMOD           DATA 0xd9
_CL             DATA 0xe9
_CH             DATA 0xf9
_CCAPM0         DATA 0xda
_CCAPM1         DATA 0xdb
_CCAPM2         DATA 0xdc
_CCAPM3         DATA 0xdd
_CCAPM4         DATA 0xde
_CCAP0H         DATA 0xfa
_CCAP1H         DATA 0xfb
_CCAP2H         DATA 0xfc
_CCAP3H         DATA 0xfd
_CCAP4H         DATA 0xfe
_CCAP0L         DATA 0xea
_CCAP1L         DATA 0xeb
_CCAP2L         DATA 0xec
_CCAP3L         DATA 0xed
_CCAP4L         DATA 0xee
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_P              BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES             BIT 0xac
_ET2            BIT 0xad
_EC             BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS             BIT 0xbc
_PT2            BIT 0xbd
_IP0D           BIT 0xbf
_PPCL           BIT 0xbe
_PT2L           BIT 0xbd
_PLS            BIT 0xbc
_PT1L           BIT 0xbb
_PX1L           BIT 0xba
_PT0L           BIT 0xb9
_PX0L           BIT 0xb8
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_RXD            BIT 0xb0
_TXD            BIT 0xb1
_INT0           BIT 0xb2
_INT1           BIT 0xb3
_T0             BIT 0xb4
_T1             BIT 0xb5
_WR             BIT 0xb6
_RD             BIT 0xb7
_P4_0           BIT 0xc0
_P4_1           BIT 0xc1
_P4_2           BIT 0xc2
_P4_3           BIT 0xc3
_P4_4           BIT 0xc4
_P4_5           BIT 0xc5
_P4_6           BIT 0xc6
_P4_7           BIT 0xc7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_SM2            BIT 0x9d
_SM1            BIT 0x9e
_SM0            BIT 0x9f
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_CP_RL2         BIT 0xc8
_C_T2           BIT 0xc9
_TR2            BIT 0xca
_EXEN2          BIT 0xcb
_TCLK           BIT 0xcc
_RCLK           BIT 0xcd
_EXF2           BIT 0xce
_TF2            BIT 0xcf
_CF             BIT 0xdf
_CR             BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	rseg BIT_BANK
bits:
	ds 1
	b0 equ  bits.0 
	b1 equ  bits.1 
	b2 equ  bits.2 
	b3 equ  bits.3 
	b4 equ  bits.4 
	b5 equ  bits.5 
	b6 equ  bits.6 
	b7 equ  bits.7 
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_position:
	ds 2
_linposition:
	ds 2
_angSetPoint:
	ds 2
_linSetPoint:
	ds 2
_error:
	ds 2
_prevError:
	ds 2
_past5:
	ds 10
_errSum:
	ds 2
_dErr:
	ds 2
_pwm_temp:
	ds 2
_temp_pwm:
	ds 2
_PIDcalculation_error_1_83:
	ds 2
_PIDcalculation_sloc0_1_0:
	ds 4
_fivePointMovingAvg_prevError_1_85:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_it_timer2
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:66: volatile int position = 1111;
	mov	_position,#0x57
	mov	(_position + 1),#0x04
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:67: volatile int linposition = 2222;
	mov	_linposition,#0xAE
	mov	(_linposition + 1),#0x08
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:68: volatile int angSetPoint = 808;
	mov	_angSetPoint,#0x28
	mov	(_angSetPoint + 1),#0x03
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:69: volatile int linSetPoint = 909;
	mov	_linSetPoint,#0x8D
	mov	(_linSetPoint + 1),#0x03
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:70: volatile int error = 0;
	clr	a
	mov	_error,a
	mov	(_error + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:71: volatile int prevError = 0;
	clr	a
	mov	_prevError,a
	mov	(_prevError + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:73: volatile int errSum = 0;
	clr	a
	mov	_errSum,a
	mov	(_errSum + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:74: volatile int dErr = 0;
	clr	a
	mov	_dErr,a
	mov	(_dErr + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:75: volatile int pwm_temp = 0;
	clr	a
	mov	_pwm_temp,a
	mov	(_pwm_temp + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:76: volatile int temp_pwm = 0;
	clr	a
	mov	_temp_pwm,a
	mov	(_temp_pwm + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:78: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:81: P0M0=0;	P0M1=0;
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:82: P1M0=0;	P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:83: P2M0=0;	P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:84: P3M0=0;	P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:85: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:86: P4M0=0;	P4M1=0;
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:89: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:90: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:91: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:92: BRL=BRG_VAL;
	mov	_BRL,#0xFA
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:93: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:96: TMOD=0B_0001_0001; // 0001 is 16-bit mode (Enhanced Timer 1, p77 in docs)
	mov	_TMOD,#0x11
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:98: TCONB=0B_11000000; //P3_5 PWM ENABLED 
	mov	_TCONB,#0xC0
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:101: TR0=0;
	clr	_TR0
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:102: TR0=1;
	setb	_TR0
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:103: TR1=1;
	setb	_TR1
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:105: RL1=250;
	mov	_RL1,#0xFA
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:106: RL0=250; 
	mov	_RL0,#0xFA
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:108: RH1=128; //Pin3.5
	mov	_RH1,#0x80
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:109: RH0=128; //Pin3.4
	mov	_RH0,#0x80
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:113: T2MOD &= 0xFC;			      /* T2OE=0;DCEN=1; */
	anl	_T2MOD,#0xFC
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:114: T2MOD |= 0x01;			      
	orl	_T2MOD,#0x01
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:116: EXF2=0;                    /* reset flag */
	clr	_EXF2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:117: TCLK=0;RCLK=0;             /* disable baud rate generator */
	clr	_TCLK
	clr	_RCLK
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:118: EXEN2=0;                   /* ignore events on T2EX */ 
	clr	_EXEN2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:119: TH2=MSB_reload_value;		/* Init msb_value */
	mov	_TH2,#0x11
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:120: TL2=LSB_reload_value;		/* Init lsb_value */
	mov	_TL2,#0xBB
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:121: RCAP2H=MSB_reload_value;	/* reload msb_value */
	mov	_RCAP2H,#0x11
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:122: RCAP2L=LSB_reload_value;	/* reload lsb_value */
	mov	_RCAP2L,#0xBB
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:123: C_T2=0;                    /* timer mode */
	clr	_C_T2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:124: CP_RL2=0;                  /* reload mode */
	clr	_CP_RL2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:125: EA=1;                      /* interupt enable */
	setb	_EA
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:126: ET2=1;                     /* enable timer2 interrupt */
	setb	_ET2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:127: TR2=1;                     /* timer2 run */
	setb	_TR2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:131: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'it_timer2'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:139: void it_timer2(void) interrupt 5 /* interrupt address is 0x002b */
;	-----------------------------------------
;	 function it_timer2
;	-----------------------------------------
_it_timer2:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:141: position = decode(1);          //HCTL1 NEEDS CONVERSION---(Sensor Resolution*4/360)*(Gear Ratio)
	mov	dptr,#0x0001
	lcall	_decode
	mov	_position,dpl
	mov	(_position + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:143: linposition = decode(2);       //HCTL2 (Sensor Resolution*4/360)*(360degrees/cm)*(Gear Ratio)   33.33;
	mov	dptr,#0x0002
	lcall	_decode
	mov	_linposition,dpl
	mov	(_linposition + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:145: angSetPoint = GetADC(1)/3.196;     //Angular Pot Reading in degrees TODO: Not reading for like 20 degrees around 0, measure actual angle to ensure precision.
	mov	dpl,#0x01
	lcall	_GetADC
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x44
	push	acc
	mov	a,#0x8B
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
	mov	_angSetPoint,dpl
	mov	(_angSetPoint + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:146: if(angSetPoint > 300)resetHCTL(2);
	clr	c
	mov	a,#0x2C
	subb	a,_angSetPoint
	mov	a,#(0x01 ^ 0x80)
	mov	b,(_angSetPoint + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L003002?
	mov	dptr,#0x0002
	lcall	_resetHCTL
L003002?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:148: linSetPoint = GetADC(0)/(9.3);  //Linear Pot Reading out of 100
	mov	dpl,#0x00
	lcall	_GetADC
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x14
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
	mov	_linSetPoint,dpl
	mov	(_linSetPoint + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:149: if(linSetPoint>80)resetHCTL(1);
	clr	c
	mov	a,#0x50
	subb	a,_linSetPoint
	clr	a
	xrl	a,#0x80
	mov	b,(_linSetPoint + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L003004?
	mov	dptr,#0x0001
	lcall	_resetHCTL
L003004?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:151: error = angSetPoint - position;
	mov	a,_angSetPoint
	clr	c
	subb	a,_position
	mov	_error,a
	mov	a,(_angSetPoint + 1)
	subb	a,(_position + 1)
	mov	(_error + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:153: temp_pwm = PIDcalculation(error); //WILL CHANGE WITH dT
	mov	dpl,_error
	mov	dph,(_error + 1)
	lcall	_PIDcalculation
	mov	_temp_pwm,dpl
	mov	(_temp_pwm + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:155: RH0 = temp_pwm;
	mov	_RH0,_temp_pwm
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:162: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:164: resetHCTL(1);
	mov	dptr,#0x0001
	lcall	_resetHCTL
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:165: resetHCTL(2);
	mov	dptr,#0x0002
	lcall	_resetHCTL
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:168: printf( FORE_BACK, COLOR_BLACK, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	clr	a
	push	acc
	push	acc
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:169: printf( CLEAR_SCREEN );
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:170: printf( GOTO_YX, 1, 1 );
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:171: printf("Motor Angle      :::");
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:172: printf("\nLin Motor Angle  :::");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:173: printf("\nSetpoint Angle   ::: ");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:174: printf("\nLinear Position  ::: ");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:176: while(1)
L004002?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:178: printf( GOTO_YX, 1, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:179: printf("%i     ", position);
	push	_position
	push	(_position + 1)
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:181: printf( GOTO_YX, 2, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:182: printf("%i     ", linposition);
	push	_linposition
	push	(_linposition + 1)
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:184: printf( GOTO_YX, 3, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x03
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:185: printf("%i    ", angSetPoint);
	push	_angSetPoint
	push	(_angSetPoint + 1)
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:187: printf( GOTO_YX, 4, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:188: printf("%i    ", linSetPoint);
	push	_linSetPoint
	push	(_linSetPoint + 1)
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:190: printf("\nPWM ::: %i    ", temp_pwm);
	push	_temp_pwm
	push	(_temp_pwm + 1)
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	L004002?
;------------------------------------------------------------
;Allocation info for local variables in function 'resetHCTL'
;------------------------------------------------------------
;select                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:197: void resetHCTL (int select)
;	-----------------------------------------
;	 function resetHCTL
;	-----------------------------------------
_resetHCTL:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:199: if(select == 1){
	cjne	r2,#0x01,L005004?
	cjne	r3,#0x00,L005004?
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:200: RST1 = 0; //Clear HCTL
	clr	_P1_1
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:202: RST1 = 1;
	setb	_P1_1
	ret
L005004?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:204: else if(select == 2){
	cjne	r2,#0x02,L005006?
	cjne	r3,#0x00,L005006?
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:205: RST2 = 0;
	clr	_P1_2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:207: RST2 = 1;
	setb	_P1_2
L005006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PIDcalculation'
;------------------------------------------------------------
;error                     Allocated with name '_PIDcalculation_error_1_83'
;output                    Allocated to registers r2 r3 
;sloc0                     Allocated with name '_PIDcalculation_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:211: int PIDcalculation (int error){
;	-----------------------------------------
;	 function PIDcalculation
;	-----------------------------------------
_PIDcalculation:
	mov	_PIDcalculation_error_1_83,dpl
	mov	(_PIDcalculation_error_1_83 + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:215: if(error<-1700)
	clr	c
	mov	a,_PIDcalculation_error_1_83
	subb	a,#0x5C
	mov	a,(_PIDcalculation_error_1_83 + 1)
	xrl	a,#0x80
	subb	a,#0x79
	jnc	L006002?
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:216: error=50;
	mov	_PIDcalculation_error_1_83,#0x32
	clr	a
	mov	(_PIDcalculation_error_1_83 + 1),a
L006002?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:219: errSum += error * dT;
	mov	dpl,_PIDcalculation_error_1_83
	mov	dph,(_PIDcalculation_error_1_83 + 1)
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x73D4
	mov	b,#0x5A
	mov	a,#0x3A
	lcall	___fsmul
	mov	_PIDcalculation_sloc0_1_0,dpl
	mov	(_PIDcalculation_sloc0_1_0 + 1),dph
	mov	(_PIDcalculation_sloc0_1_0 + 2),b
	mov	(_PIDcalculation_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_errSum
	mov	dph,(_errSum + 1)
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	push	_PIDcalculation_sloc0_1_0
	push	(_PIDcalculation_sloc0_1_0 + 1)
	push	(_PIDcalculation_sloc0_1_0 + 2)
	push	(_PIDcalculation_sloc0_1_0 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fs2sint
	mov	_errSum,dpl
	mov	(_errSum + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:220: dErr = (error - fivePointMovingAvg(prevError)); //Dividing by dT makes this huge
	mov	dpl,_prevError
	mov	dph,(_prevError + 1)
	lcall	_fivePointMovingAvg
	mov	r2,dpl
	mov	r3,dph
	mov	a,_PIDcalculation_error_1_83
	clr	c
	subb	a,r2
	mov	_dErr,a
	mov	a,(_PIDcalculation_error_1_83 + 1)
	subb	a,r3
	mov	(_dErr + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:223: output = kp * error + ki * errSum + kd * dErr;
	mov	dpl,_errSum
	mov	dph,(_errSum + 1)
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dptr,#0x7CEE
	mov	b,#0x3F
	mov	a,#0x3E
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_dErr
	mov	dph,(_dErr + 1)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x4FDF
	mov	b,#0x8D
	mov	a,#0x3D
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:226: if(output > 128) output = 128;
	clr	c
	mov	a,#0x80
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L006006?
	mov	r2,#0x80
	mov	r3,#0x00
	sjmp	L006007?
L006006?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:227: else if (output < -128) output = -127; //OVERFLOWS AT 255
	clr	c
	mov	a,r2
	subb	a,#0x80
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x7f
	jnc	L006007?
	mov	r2,#0x81
	mov	r3,#0xFF
L006007?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:228: output = 128 - output;
	mov	a,#0x80
	clr	c
	subb	a,r2
	mov	_pwm_temp,a
	clr	a
	subb	a,r3
	mov	(_pwm_temp + 1),a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:232: prevError = error;
	mov	_prevError,_PIDcalculation_error_1_83
	mov	(_prevError + 1),(_PIDcalculation_error_1_83 + 1)
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:235: return pwm_temp;
	mov	dpl,_pwm_temp
	mov	dph,(_pwm_temp + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'fivePointMovingAvg'
;------------------------------------------------------------
;prevError                 Allocated with name '_fivePointMovingAvg_prevError_1_85'
;i                         Allocated to registers r6 r7 
;avgError                  Allocated to registers 
;sum                       Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:238: int fivePointMovingAvg (int prevError){
;	-----------------------------------------
;	 function fivePointMovingAvg
;	-----------------------------------------
_fivePointMovingAvg:
	mov	_fivePointMovingAvg_prevError_1_85,dpl
	mov	(_fivePointMovingAvg_prevError_1_85 + 1),dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:240: int avgError, sum = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:243: for(i=5; i>0; i--)
	mov	r6,#0x05
	mov	r7,#0x00
L007001?:
	clr	c
	clr	a
	subb	a,r6
	clr	a
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	L007004?
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:244: past5[i] = past5[i-1];
	mov	ar2,r6
	mov	a,r7
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	mov	a,r2
	add	a,#_past5
	mov	r0,a
	mov	ar2,r6
	dec	r2
	mov	a,r2
	add	a,r2
	add	a,#_past5
	mov	r1,a
	mov	ar2,@r1
	inc	r1
	mov	ar3,@r1
	dec	r1
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	dec	r0
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:243: for(i=5; i>0; i--)
	dec	r6
	cjne	r6,#0xff,L007018?
	dec	r7
L007018?:
	sjmp	L007001?
L007004?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:245: past5[0] = prevError;
	mov	_past5,_fivePointMovingAvg_prevError_1_85
	mov	(_past5 + 1),(_fivePointMovingAvg_prevError_1_85 + 1)
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:248: for(i=6; i>0; i--)
	mov	r2,#0x06
	mov	r3,#0x00
L007005?:
	clr	c
	clr	a
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L007008?
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:249: sum += past5[i];
	mov	ar6,r2
	mov	a,r3
	xch	a,r6
	add	a,acc
	xch	a,r6
	rlc	a
	mov	a,r6
	add	a,#_past5
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	dec	r0
	mov	a,r6
	add	a,r4
	mov	r4,a
	mov	a,r7
	addc	a,r5
	mov	r5,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:248: for(i=6; i>0; i--)
	dec	r2
	cjne	r2,#0xff,L007020?
	dec	r3
L007020?:
	sjmp	L007005?
L007008?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:250: avgError = sum / 5;
	mov	__divsint_PARM_2,#0x05
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:252: return avgError;
	ljmp	__divsint
;------------------------------------------------------------
;Allocation info for local variables in function 'decode'
;------------------------------------------------------------
;OE                        Allocated to registers r2 r3 
;result                    Allocated to registers 
;mult                      Allocated to registers 
;temp                      Allocated to registers r2 r3 
;Result_lo                 Allocated to registers r7 r0 
;Result_2nd                Allocated to registers 
;Result_3rd                Allocated to registers r5 r6 
;Result_hi                 Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:279: unsigned int decode (int OE)
;	-----------------------------------------
;	 function decode
;	-----------------------------------------
_decode:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:289: if(OE==1)P3_6 = 1; //Disable OE
	clr	a
	cjne	r2,#0x01,L008024?
	cjne	r3,#0x00,L008024?
	inc	a
L008024?:
	mov	r4,a
	jz	L008004?
	setb	_P3_6
	sjmp	L008005?
L008004?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:290: else if(OE==2)P3_7 = 1; //Disable OE
	cjne	r2,#0x02,L008005?
	cjne	r3,#0x00,L008005?
	setb	_P3_7
L008005?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:292: P4_3 = 0; //Sel1 TEST
	clr	_P4_3
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:293: P4_4 = 1; //SEL2 = 1 (MSB)
	setb	_P4_4
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:295: if(OE==1)P3_6 = 0; //Enable OE
	mov	a,r4
	jz	L008009?
	clr	_P3_6
	sjmp	L008010?
L008009?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:296: else if(OE==2)P3_7 = 0; //Enable OE	
	cjne	r2,#0x02,L008010?
	cjne	r3,#0x00,L008010?
	clr	_P3_7
L008010?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:298: Result_hi = readBits(OE); // Get MSB
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	lcall	_readBits
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:299: P4_3 = 1; //SEL1 = 1 (2nd Byte)
	setb	_P4_3
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:300: P4_4 = 1; //SEL2 = 1 (2nd Byte)
	setb	_P4_4
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:301: Result_2nd  = readBits(OE);
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	lcall	_readBits
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:302: P4_3 = 0; //SEL1 = 0 (3rd Byte)
	clr	_P4_3
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:303: P4_4 = 0; //SEL2 = 0 (3rd Byte)
	clr	_P4_4
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:304: Result_3rd = readBits(OE);
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	lcall	_readBits
	mov	r5,dpl
	mov	r6,dph
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:305: P4_3 = 1; //SEL1 = 1 (LSB)
	setb	_P4_3
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:306: P4_4 = 0; //SEL2 = 0 (LSB)
	clr	_P4_4
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:307: Result_lo = readBits(OE); // Get LSB
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_readBits
	mov	r7,dpl
	mov	r0,dph
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:309: if(OE==1)P3_6 = 1; //Disable OE
	mov	a,r4
	jz	L008014?
	setb	_P3_6
	sjmp	L008015?
L008014?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:310: else if(OE==2)P3_7 = 1; //Disable OE
	cjne	r2,#0x02,L008015?
	cjne	r3,#0x00,L008015?
	setb	_P3_7
L008015?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:317: temp = Result_3rd*mult; //Assign 3rd Byte
	mov	__mulint_PARM_2,#0x00
	mov	(__mulint_PARM_2 + 1),#0x01
	mov	dpl,r5
	mov	dph,r6
	push	ar7
	push	ar0
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	pop	ar0
	pop	ar7
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:318: result = result + temp;
	mov	a,r2
	add	a,r7
	mov	dpl,a
	mov	a,r3
	addc	a,r0
	mov	dph,a
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:328: return result;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readBits'
;------------------------------------------------------------
;select                    Allocated to registers r2 r3 
;num                       Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:332: unsigned int readBits(int select)
;	-----------------------------------------
;	 function readBits
;	-----------------------------------------
_readBits:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:334: unsigned int num = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:336: if(select == 1){
	cjne	r2,#0x01,L009010?
	cjne	r3,#0x00,L009010?
	sjmp	L009011?
L009010?:
	ljmp	L009004?
L009011?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:337: num = P2_7*128 + P2_6*64 + P2_5*32 + P2_4*16 + P2_3*8 + P2_2*4 + P2_1*2 + P2_0*1;
	mov	c,_P2_7
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	anl	a,#0x01
	mov	c,acc.0
	xch	a,r6
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
	mov	c,_P2_6
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	anl	a,#0x03
	mov	c,acc.0
	xch	a,r0
	rrc	a
	xch	a,r0
	rrc	a
	mov	c,acc.0
	xch	a,r0
	rrc	a
	xch	a,r0
	rrc	a
	xch	a,r0
	mov	r1,a
	mov	a,r0
	add	a,r6
	mov	r6,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_5
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	swap	a
	rl	a
	anl	a,#0xe0
	xch	a,r0
	swap	a
	rl	a
	xch	a,r0
	xrl	a,r0
	xch	a,r0
	anl	a,#0xe0
	xch	a,r0
	xrl	a,r0
	mov	r1,a
	mov	a,r0
	add	a,r6
	mov	r6,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	swap	a
	anl	a,#0xf0
	xch	a,r0
	swap	a
	xch	a,r0
	xrl	a,r0
	xch	a,r0
	anl	a,#0xf0
	xch	a,r0
	xrl	a,r0
	mov	r1,a
	mov	a,r0
	add	a,r6
	mov	r6,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_3
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	swap	a
	rr	a
	anl	a,#0xf8
	xch	a,r0
	swap	a
	rr	a
	xch	a,r0
	xrl	a,r0
	xch	a,r0
	anl	a,#0xf8
	xch	a,r0
	xrl	a,r0
	mov	r1,a
	mov	a,r0
	add	a,r6
	mov	r6,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_2
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	xch	a,r0
	add	a,acc
	xch	a,r0
	rlc	a
	xch	a,r0
	add	a,acc
	xch	a,r0
	rlc	a
	mov	r1,a
	mov	a,r0
	add	a,r6
	mov	r6,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_1
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	xch	a,r0
	add	a,acc
	xch	a,r0
	rlc	a
	mov	r1,a
	mov	a,r0
	add	a,r6
	mov	r6,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_0
	clr	a
	rlc	a
	mov	r0,a
	mov	r1,#0x00
	mov	a,r0
	add	a,r6
	mov	r4,a
	mov	a,r1
	addc	a,r7
	mov	r5,a
	ljmp	L009005?
L009004?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:340: else if(select == 2){
	cjne	r2,#0x02,L009012?
	cjne	r3,#0x00,L009012?
	sjmp	L009013?
L009012?:
	ljmp	L009005?
L009013?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:341: num = P0_7*128 + P0_6*64 + P0_5*32 + P0_4*16 + P0_3*8 + P0_2*4 + P0_1*2 + P0_0*1;
	mov	c,_P0_7
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	anl	a,#0x01
	mov	c,acc.0
	xch	a,r2
	rrc	a
	xch	a,r2
	rrc	a
	xch	a,r2
	mov	r3,a
	mov	c,_P0_6
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	anl	a,#0x03
	mov	c,acc.0
	xch	a,r6
	rrc	a
	xch	a,r6
	rrc	a
	mov	c,acc.0
	xch	a,r6
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
	mov	c,_P0_5
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	swap	a
	rl	a
	anl	a,#0xe0
	xch	a,r6
	swap	a
	rl	a
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	anl	a,#0xe0
	xch	a,r6
	xrl	a,r6
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
	mov	c,_P0_4
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	swap	a
	anl	a,#0xf0
	xch	a,r6
	swap	a
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	anl	a,#0xf0
	xch	a,r6
	xrl	a,r6
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
	mov	c,_P0_3
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	swap	a
	rr	a
	anl	a,#0xf8
	xch	a,r6
	swap	a
	rr	a
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	anl	a,#0xf8
	xch	a,r6
	xrl	a,r6
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
	mov	c,_P0_2
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	xch	a,r6
	add	a,acc
	xch	a,r6
	rlc	a
	xch	a,r6
	add	a,acc
	xch	a,r6
	rlc	a
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
	mov	c,_P0_1
	clr	a
	rlc	a
	mov	r6,a
	clr	a
	xch	a,r6
	add	a,acc
	xch	a,r6
	rlc	a
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
	mov	c,_P0_0
	clr	a
	rlc	a
	mov	r6,a
	mov	r7,#0x00
	mov	a,r6
	add	a,r2
	mov	r4,a
	mov	a,r7
	addc	a,r3
	mov	r5,a
L009005?:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:344: return num;
	mov	dpl,r4
	mov	dph,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:348: void waitms (void){
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:357: _endasm;
	
	mov R2, #1
	L3:
	mov R1, #1
	L2:
	mov R0, #184
	L1:
	djnz R0, L1 ; 2 machine cycles-> 0.5425347us*184=100us
	djnz R1, L2 ; 100us*10=1ms
	djnz R2, L3 ; 1ms*25= 25ms
	ret
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:374: void SPIWrite(unsigned char value)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:375: {	SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	anl	_SPSTA,#0x7F
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:376: SPDAT=value;
	mov	_SPDAT,r2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:377: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
L011001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L011001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:381: unsigned int GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:386: SPCON&=(~SPEN); // Disable SPI
	anl	_SPCON,#0xBF
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:387: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	mov	_SPCON,#0x3F
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:388: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:390: CE=0; // Activate the MCP3004 ADC.
	clr	_P1_4
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:391: SPIWrite(channel|0x18);	// Send start bit, single/diff* bit, D2, D1, and D0 bits.
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:392: for(adc=0; adc<10; adc++); // Wait for S/H to setup
	mov	r2,#0x0A
	mov	r3,#0x00
L012003?:
	dec	r2
	cjne	r2,#0xff,L012009?
	dec	r3
L012009?:
	mov	a,r2
	orl	a,r3
	jnz	L012003?
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:393: SPIWrite(0x55); // Read bits 9 down to 4
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:394: adc=((SPDAT&0x3f)*0x100); 					
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:395: SPIWrite(0x55);// Read bits 3 down to 0
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:396: CE=1; // Deactivate the MCP3004 ADC.
	setb	_P1_4
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:397: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:398: adc>>=4;
	swap	a
	xch	a,r2
	swap	a
	anl	a,#0x0f
	xrl	a,r2
	xch	a,r2
	anl	a,#0x0f
	xch	a,r2
	xrl	a,r2
	xch	a,r2
;	C:\Users\Pouria\Desktop\robot-arm\MK1_PID_interrupt.c:400: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[0;3%d;4%dm'
	db 0x00
__str_1:
	db 0x1B
	db '[2J'
	db 0x00
__str_2:
	db 0x1B
	db '[%d;%dH'
	db 0x00
__str_3:
	db 'Motor Angle      :::'
	db 0x00
__str_4:
	db 0x0A
	db 'Lin Motor Angle  :::'
	db 0x00
__str_5:
	db 0x0A
	db 'Setpoint Angle   ::: '
	db 0x00
__str_6:
	db 0x0A
	db 'Linear Position  ::: '
	db 0x00
__str_7:
	db '%i     '
	db 0x00
__str_8:
	db '%i    '
	db 0x00
__str_9:
	db 0x0A
	db 'PWM ::: %i    '
	db 0x00

	CSEG

end
