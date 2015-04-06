;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Mon Apr 06 14:11:10 2015
;--------------------------------------------------------
$name MK2_StableStephane
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
	public _underflow
	public _overflow
	public _PIDcalculation_PARM_2
	public _kd
	public _ki
	public _count
	public _linear_pwm
	public _angular_pwm
	public _pwm_temp
	public _dErr
	public _errSum
	public _past5
	public _prevError
	public _error
	public _linerror
	public _angerror
	public _linSetPoint
	public _angSetPoint
	public _linposition
	public _manualMotorPos
	public _prevangPosition
	public _angPosition
	public _linearOverflowCount
	public _PIDcalculation
	public _resetHCTL
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
_angPosition:
	ds 2
_prevangPosition:
	ds 2
_manualMotorPos:
	ds 2
_linposition:
	ds 2
_angSetPoint:
	ds 2
_linSetPoint:
	ds 2
_angerror:
	ds 2
_linerror:
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
_angular_pwm:
	ds 2
_linear_pwm:
	ds 2
_count:
	ds 2
_ki:
	ds 4
_kd:
	ds 4
_PIDcalculation_PARM_2:
	ds 2
_PIDcalculation_error_1_85:
	ds 2
_PIDcalculation_sloc0_1_0:
	ds 4
_fivePointMovingAvg_prevError_1_93:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
_readBits_sloc0_1_0:
	ds 1
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
_overflow:
	DBIT	1
_underflow:
	DBIT	1
_readBits_stable_1_98:
	DBIT	1
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:69: volatile int angPosition = 1111;
	mov	_angPosition,#0x57
	mov	(_angPosition + 1),#0x04
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:70: volatile int prevangPosition = 0;
	clr	a
	mov	_prevangPosition,a
	mov	(_prevangPosition + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:71: volatile int manualMotorPos = 100;
	mov	_manualMotorPos,#0x64
	clr	a
	mov	(_manualMotorPos + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:72: volatile int linposition = 2222;
	mov	_linposition,#0xAE
	mov	(_linposition + 1),#0x08
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:73: volatile int angSetPoint = 808;
	mov	_angSetPoint,#0x28
	mov	(_angSetPoint + 1),#0x03
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:74: volatile int linSetPoint = 909;
	mov	_linSetPoint,#0x8D
	mov	(_linSetPoint + 1),#0x03
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:75: volatile int angerror = 0;
	clr	a
	mov	_angerror,a
	mov	(_angerror + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:76: volatile int linerror = 0;
	clr	a
	mov	_linerror,a
	mov	(_linerror + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:78: volatile int error = 0;
	clr	a
	mov	_error,a
	mov	(_error + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:79: volatile int prevError = 0;
	clr	a
	mov	_prevError,a
	mov	(_prevError + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:81: volatile int errSum = 0;
	clr	a
	mov	_errSum,a
	mov	(_errSum + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:82: volatile int dErr = 0;
	clr	a
	mov	_dErr,a
	mov	(_dErr + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:84: volatile int pwm_temp = 0;
	clr	a
	mov	_pwm_temp,a
	mov	(_pwm_temp + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:85: volatile int angular_pwm = 0;
	clr	a
	mov	_angular_pwm,a
	mov	(_angular_pwm + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:86: volatile int linear_pwm = 0;
	clr	a
	mov	_linear_pwm,a
	mov	(_linear_pwm + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:87: volatile unsigned int count = 0;
	clr	a
	mov	_count,a
	mov	(_count + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:90: volatile float ki, kd = 0;
	mov	_kd,#0x00
	mov	(_kd + 1),#0x00
	mov	(_kd + 2),#0x00
	mov	(_kd + 3),#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:88: volatile bit overflow = 0;
	clr	_overflow
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:89: volatile bit underflow = 0;
	clr	_underflow
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:92: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:95: P0M0=0; P0M1=0;
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:96: P1M0=0; P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:97: P2M0=0; P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:98: P3M0=0; P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:99: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:100: P4M0=0; P4M1=0;
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:103: PCON|=0x80;
	orl	_PCON,#0x80
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:104: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:105: BDRCON=0;
	mov	_BDRCON,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:106: BRL=BRG_VAL;
	mov	_BRL,#0xFA
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:107: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:110: TMOD=0B_0001_0001; // 0001 is 16-bit mode (Enhanced Timer 1, p77 in docs)
	mov	_TMOD,#0x11
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:112: TCONB=0B_11000000; //P3_5 PWM ENABLED 
	mov	_TCONB,#0xC0
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:115: TR0=0;
	clr	_TR0
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:116: TR0=1;
	setb	_TR0
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:117: TR1=1;
	setb	_TR1
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:119: RL1=250;
	mov	_RL1,#0xFA
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:120: RL0=250; 
	mov	_RL0,#0xFA
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:122: RH1=128; //Pin3.5
	mov	_RH1,#0x80
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:123: RH0=128; //Pin3.4
	mov	_RH0,#0x80
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:127: T2MOD &= 0xFC;                /* T2OE=0;DCEN=1; */
	anl	_T2MOD,#0xFC
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:128: T2MOD |= 0x01;                
	orl	_T2MOD,#0x01
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:130: EXF2=0;                    /* reset flag */
	clr	_EXF2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:131: TCLK=0;RCLK=0;             /* disable baud rate generator */
	clr	_TCLK
	clr	_RCLK
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:132: EXEN2=0;                   /* ignore events on T2EX */ 
	clr	_EXEN2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:133: TH2=MSB_reload_value;       /* Init msb_value */
	mov	_TH2,#0x13
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:134: TL2=LSB_reload_value;       /* Init lsb_value */
	mov	_TL2,#0x88
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:135: RCAP2H=MSB_reload_value;    /* reload msb_value */
	mov	_RCAP2H,#0x13
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:136: RCAP2L=LSB_reload_value;    /* reload lsb_value */
	mov	_RCAP2L,#0x88
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:137: C_T2=0;                    /* timer mode */
	clr	_C_T2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:138: CP_RL2=0;                  /* reload mode */
	clr	_CP_RL2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:139: EA=1;                      /* interupt enable */
	setb	_EA
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:140: ET2=1;                     /* enable timer2 interrupt */
	setb	_ET2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:142: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'it_timer2'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:150: void it_timer2(void) interrupt 5 /* interrupt address is 0x002b */
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:153: angSetPoint = GetADC(0)/3.196;	   //Angular Pot Reading in degrees TODO: Not reading for like 20 degrees around 0, measure actual angle to ensure precision.
	mov	dpl,#0x00
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:154: printf( GOTO_YX, 1, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:155: printf("%i    ", angSetPoint);
	push	_angSetPoint
	push	(_angSetPoint + 1)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:157: printf( GOTO_YX, 2, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:158: angPosition = decode(1)/33.3333;          //HCTL1 (Sensor Resolution*4/360)*(Gear Ratio) = 6*4*500/360 = 33.333333
	mov	dptr,#0x0001
	lcall	_decode
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x4D
	push	acc
	mov	a,#0x55
	push	acc
	mov	a,#0x05
	push	acc
	mov	a,#0x42
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
	mov	_angPosition,dpl
	mov	(_angPosition + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:159: printf("%i     ", angPosition);
	push	_angPosition
	push	(_angPosition + 1)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:175: angerror = angSetPoint - angPosition;
	mov	a,_angSetPoint
	clr	c
	subb	a,_angPosition
	mov	_angerror,a
	mov	a,(_angSetPoint + 1)
	subb	a,(_angPosition + 1)
	mov	(_angerror + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:176: angular_pwm = PIDcalculation(angerror, 1);
	mov	_PIDcalculation_PARM_2,#0x01
	clr	a
	mov	(_PIDcalculation_PARM_2 + 1),a
	mov	dpl,_angerror
	mov	dph,(_angerror + 1)
	lcall	_PIDcalculation
	mov	_angular_pwm,dpl
	mov	(_angular_pwm + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:178: RH1 = angSetPoint/1.252;
	mov	dpl,_angSetPoint
	mov	dph,(_angSetPoint + 1)
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x89
	push	acc
	mov	a,#0x41
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0x3F
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
	lcall	___fs2uchar
	mov	_RH1,dpl
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:179: printf( GOTO_YX, 3, 22);
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x03
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:180: printf("%i    ", RH1);
	mov	r2,_RH1
	mov	r3,#0x00
	push	ar2
	push	ar3
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:183: linSetPoint = GetADC(1);	//Linear Pot Reading out of 1000
	mov	dpl,#0x01
	lcall	_GetADC
	mov	_linSetPoint,dpl
	mov	(_linSetPoint + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:184: printf( GOTO_YX, 5, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x05
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:185: printf("%i    ", linSetPoint);
	push	_linSetPoint
	push	(_linSetPoint + 1)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:188: linposition = decode(2)/17.7777;   //HCTL2 (Sensor Resolution*4/360)*(Gear Ratio) = 17.777777777 = 1 count per turn;
	mov	dptr,#0x0002
	lcall	_decode
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0xBB
	push	acc
	mov	a,#0x38
	push	acc
	mov	a,#0x8E
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
	mov	_linposition,dpl
	mov	(_linposition + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:191: linearOverflowCount(linposition);
	mov	dpl,_linposition
	mov	dph,(_linposition + 1)
	lcall	_linearOverflowCount
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:192: linposition = (linposition + (count*3686))/56;
	mov	__mulint_PARM_2,_count
	mov	(__mulint_PARM_2 + 1),(_count + 1)
	mov	dptr,#0x0E66
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	r4,_linposition
	mov	r5,(_linposition + 1)
	mov	a,r2
	add	a,r4
	mov	dpl,a
	mov	a,r3
	addc	a,r5
	mov	dph,a
	mov	__divuint_PARM_2,#0x38
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	lcall	__divuint
	mov	_linposition,dpl
	mov	(_linposition + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:193: printf( GOTO_YX, 6, 22 );
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x06
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:194: printf("%i     ", linposition);
	push	_linposition
	push	(_linposition + 1)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:197: linerror = linSetPoint - linposition;
	mov	a,_linSetPoint
	clr	c
	subb	a,_linposition
	mov	_linerror,a
	mov	a,(_linSetPoint + 1)
	subb	a,(_linposition + 1)
	mov	(_linerror + 1),a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:198: linear_pwm = PIDcalculation(linerror, 2);
	mov	_PIDcalculation_PARM_2,#0x02
	clr	a
	mov	(_PIDcalculation_PARM_2 + 1),a
	mov	dpl,_linerror
	mov	dph,(_linerror + 1)
	lcall	_PIDcalculation
	mov	_linear_pwm,dpl
	mov	(_linear_pwm + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:200: RH0 = linear_pwm;
	mov	_RH0,_linear_pwm
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:201: printf( GOTO_YX, 7, 22);
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,#0x07
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:202: printf("%i    ", RH0);
	mov	r2,_RH0
	mov	r3,#0x00
	push	ar2
	push	ar3
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:210: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:213: resetHCTL(1);
	mov	dptr,#0x0001
	lcall	_resetHCTL
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:214: resetHCTL(2);
	mov	dptr,#0x0002
	lcall	_resetHCTL
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:216: printf( FORE_BACK, COLOR_BLACK, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	clr	a
	push	acc
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:217: printf( CLEAR_SCREEN );
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:220: while(P1_3 == 0){
L004001?:
	jb	_P1_3,L004003?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:221: RH0 = 0;
	mov	_RH0,#0x00
	sjmp	L004001?
L004003?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:224: printf( GOTO_YX, 1, 1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:225: printf("Setpoint Angle   ::: ");			//1
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:226: printf("\nMotor Angle      :::");			//2
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:227: printf("\nAngular PWM      ::: ");			//3
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:229: printf("\n\nLinear Setpoint  ::: ");		//5
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:230: printf("\nLin Motor y-Pos  ::: ");			//6
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:231: printf("\nLinear PWM	     ::: ");		//7
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:239: TR2=1;
	setb	_TR2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:241: while(1){
L004007?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:243: printf( FORE_BACK, COLOR_BLACK, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	clr	a
	push	acc
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:244: printf( CLEAR_SCREEN );
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:246: printf( GOTO_YX, 1, 1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:247: printf("Setpoint Angle   ::: ");			//1
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:248: printf("\nMotor Angle      :::");			//2
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:249: printf("\nAngular PWM      ::: ");			//3
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:251: printf("\n\nLinear Setpoint  ::: ");		//5
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:252: printf("\nLin Motor y-Pos  ::: ");			//6
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:253: printf("\nLinear PWM	     ::: ");		//7
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:255: if(P1_3 == 1)printf("Switch 5V");   //resetHCTL(2); /
	jb	_P1_3,L004016?
	ljmp	L004007?
L004016?:
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L004007?
;------------------------------------------------------------
;Allocation info for local variables in function 'linearOverflowCount'
;------------------------------------------------------------
;linposition               Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:259: void linearOverflowCount (int linposition){
;	-----------------------------------------
;	 function linearOverflowCount
;	-----------------------------------------
_linearOverflowCount:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:260: if(overflow == 1){
	jnb	_overflow,L005004?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:261: if(linposition < 1000)count++;
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x83
	jnc	L005002?
	mov	a,#0x01
	add	a,_count
	mov	_count,a
	clr	a
	addc	a,(_count + 1)
	mov	(_count + 1),a
L005002?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:262: overflow = 0;
	clr	_overflow
L005004?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:265: if(underflow == 1){
	jnb	_underflow,L005008?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:266: if(linposition > 3000)count--;
	clr	c
	mov	a,#0xB8
	subb	a,r2
	mov	a,#(0x0B ^ 0x80)
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L005006?
	dec	_count
	mov	a,#0xff
	cjne	a,_count,L005026?
	dec	(_count + 1)
L005026?:
L005006?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:267: underflow = 0;
	clr	_underflow
L005008?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:270: if(linposition > 3550)overflow = 1;
	clr	c
	mov	a,#0xDE
	subb	a,r2
	mov	a,#(0x0D ^ 0x80)
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L005012?
	setb	_overflow
	ret
L005012?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:271: else if(linposition < 130)underflow = 1;
	clr	c
	mov	a,r2
	subb	a,#0x82
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L005014?
	setb	_underflow
L005014?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PIDcalculation'
;------------------------------------------------------------
;mselect                   Allocated with name '_PIDcalculation_PARM_2'
;error                     Allocated with name '_PIDcalculation_error_1_85'
;output                    Allocated to registers r2 r3 
;sloc0                     Allocated with name '_PIDcalculation_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:274: int PIDcalculation (int error, int mselect){
;	-----------------------------------------
;	 function PIDcalculation
;	-----------------------------------------
_PIDcalculation:
	mov	_PIDcalculation_error_1_85,dpl
	mov	(_PIDcalculation_error_1_85 + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:277: if(mselect == 1){
	mov	a,#0x01
	cjne	a,_PIDcalculation_PARM_2,L006016?
	clr	a
	cjne	a,(_PIDcalculation_PARM_2 + 1),L006016?
	sjmp	L006017?
L006016?:
	sjmp	L006002?
L006017?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:278: ki = 0;
	mov	_ki,#0x00
	mov	(_ki + 1),#0x00
	mov	(_ki + 2),#0x00
	mov	(_ki + 3),#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:279: kd = 0;
	mov	_kd,#0x00
	mov	(_kd + 1),#0x00
	mov	(_kd + 2),#0x00
	mov	(_kd + 3),#0x00
L006002?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:282: if(mselect == 2){
	mov	a,#0x02
	cjne	a,_PIDcalculation_PARM_2,L006018?
	clr	a
	cjne	a,(_PIDcalculation_PARM_2 + 1),L006018?
	sjmp	L006019?
L006018?:
	sjmp	L006004?
L006019?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:283: ki = 0.5;
	mov	_ki,#0x00
	mov	(_ki + 1),#0x00
	mov	(_ki + 2),#0x00
	mov	(_ki + 3),#0x3F
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:284: kd = 0.0009; //0.1
	mov	_kd,#0xFA
	mov	(_kd + 1),#0xED
	mov	(_kd + 2),#0x6B
	mov	(_kd + 3),#0x3A
L006004?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:291: errSum += error * dT;
	mov	dpl,_PIDcalculation_error_1_85
	mov	dph,(_PIDcalculation_error_1_85 + 1)
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
	mov	dptr,#0x31F9
	mov	b,#0xE6
	mov	a,#0x3C
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:292: dErr = (error - fivePointMovingAvg(prevError))/dT; //Dividing by dT makes this huge
	mov	dpl,_prevError
	mov	dph,(_prevError + 1)
	lcall	_fivePointMovingAvg
	mov	r2,dpl
	mov	r3,dph
	mov	a,_PIDcalculation_error_1_85
	clr	c
	subb	a,r2
	mov	dpl,a
	mov	a,(_PIDcalculation_error_1_85 + 1)
	subb	a,r3
	mov	dph,a
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,#0xF9
	push	acc
	mov	a,#0x31
	push	acc
	mov	a,#0xE6
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
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
	mov	_dErr,dpl
	mov	(_dErr + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:295: output = kp * error + ki * errSum + kd * dErr;
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
	mov	dpl,_ki
	mov	dph,(_ki + 1)
	mov	b,(_ki + 2)
	mov	a,(_ki + 3)
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
	mov	dpl,_kd
	mov	dph,(_kd + 1)
	mov	b,(_kd + 2)
	mov	a,(_kd + 3)
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:298: if(output > 127) output = 127;
	clr	c
	mov	a,#0x7F
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L006008?
	mov	r2,#0x7F
	mov	r3,#0x00
	sjmp	L006009?
L006008?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:299: else if (output < -128)output = -128;
	clr	c
	mov	a,r2
	subb	a,#0x80
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x7f
	jnc	L006009?
	mov	r2,#0x80
	mov	r3,#0xFF
L006009?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:300: output = 128 + output;
	mov	a,#0x80
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:302: prevError = error;
	mov	_prevError,_PIDcalculation_error_1_85
	mov	(_prevError + 1),(_PIDcalculation_error_1_85 + 1)
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:304: return output;
	mov	dpl,r2
	mov	dph,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'resetHCTL'
;------------------------------------------------------------
;select                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:307: void resetHCTL (int select)
;	-----------------------------------------
;	 function resetHCTL
;	-----------------------------------------
_resetHCTL:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:309: if(select == 1){
	cjne	r2,#0x01,L007004?
	cjne	r3,#0x00,L007004?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:310: RST1 = 0; //Clear HCTL
	clr	_P1_1
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:312: RST1 = 1;
	setb	_P1_1
	ret
L007004?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:314: else if(select == 2){
	cjne	r2,#0x02,L007006?
	cjne	r3,#0x00,L007006?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:315: RST2 = 0;
	clr	_P1_2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:317: RST2 = 1;
	setb	_P1_2
L007006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'fivePointMovingAvg'
;------------------------------------------------------------
;prevError                 Allocated with name '_fivePointMovingAvg_prevError_1_93'
;i                         Allocated to registers r6 r7 
;avgError                  Allocated to registers 
;sum                       Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:321: int fivePointMovingAvg (int prevError){
;	-----------------------------------------
;	 function fivePointMovingAvg
;	-----------------------------------------
_fivePointMovingAvg:
	mov	_fivePointMovingAvg_prevError_1_93,dpl
	mov	(_fivePointMovingAvg_prevError_1_93 + 1),dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:323: int avgError, sum = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:326: for(i=5; i>0; i--)
	mov	r6,#0x05
	mov	r7,#0x00
L008001?:
	clr	c
	clr	a
	subb	a,r6
	clr	a
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	L008004?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:327: past5[i] = past5[i-1];
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:326: for(i=5; i>0; i--)
	dec	r6
	cjne	r6,#0xff,L008018?
	dec	r7
L008018?:
	sjmp	L008001?
L008004?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:328: past5[0] = prevError;
	mov	_past5,_fivePointMovingAvg_prevError_1_93
	mov	(_past5 + 1),(_fivePointMovingAvg_prevError_1_93 + 1)
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:331: for(i=6; i>0; i--)
	mov	r2,#0x06
	mov	r3,#0x00
L008005?:
	clr	c
	clr	a
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L008008?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:332: sum += past5[i];
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:331: for(i=6; i>0; i--)
	dec	r2
	cjne	r2,#0xff,L008020?
	dec	r3
L008020?:
	sjmp	L008005?
L008008?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:333: avgError = sum / 5;
	mov	__divsint_PARM_2,#0x05
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:335: return avgError;
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:362: unsigned int decode (int OE)
;	-----------------------------------------
;	 function decode
;	-----------------------------------------
_decode:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:372: if(OE==1)P3_6 = 1; //Disable OE
	clr	a
	cjne	r2,#0x01,L009024?
	cjne	r3,#0x00,L009024?
	inc	a
L009024?:
	mov	r4,a
	jz	L009004?
	setb	_P3_6
	sjmp	L009005?
L009004?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:373: else if(OE==2)P3_7 = 1; //Disable OE
	cjne	r2,#0x02,L009005?
	cjne	r3,#0x00,L009005?
	setb	_P3_7
L009005?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:375: P4_3 = 0; //Sel1 TEST
	clr	_P4_3
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:376: P4_4 = 1; //SEL2 = 1 (MSB)
	setb	_P4_4
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:378: if(OE==1)P3_6 = 0; //Enable OE
	mov	a,r4
	jz	L009009?
	clr	_P3_6
	sjmp	L009010?
L009009?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:379: else if(OE==2)P3_7 = 0; //Enable OE 
	cjne	r2,#0x02,L009010?
	cjne	r3,#0x00,L009010?
	clr	_P3_7
L009010?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:381: Result_hi = readBits(OE); // Get MSB
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	lcall	_readBits
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:382: P4_3 = 1; //SEL1 = 1 (2nd Byte)
	setb	_P4_3
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:383: P4_4 = 1; //SEL2 = 1 (2nd Byte)
	setb	_P4_4
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:384: Result_2nd  = readBits(OE);
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	lcall	_readBits
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:385: P4_3 = 0; //SEL1 = 0 (3rd Byte)
	clr	_P4_3
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:386: P4_4 = 0; //SEL2 = 0 (3rd Byte)
	clr	_P4_4
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:387: Result_3rd = readBits(OE);
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:388: P4_3 = 1; //SEL1 = 1 (LSB)
	setb	_P4_3
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:389: P4_4 = 0; //SEL2 = 0 (LSB)
	clr	_P4_4
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:390: Result_lo = readBits(OE); // Get LSB
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:392: if(OE==1)P3_6 = 1; //Disable OE
	mov	a,r4
	jz	L009014?
	setb	_P3_6
	sjmp	L009015?
L009014?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:393: else if(OE==2)P3_7 = 1; //Disable OE
	cjne	r2,#0x02,L009015?
	cjne	r3,#0x00,L009015?
	setb	_P3_7
L009015?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:400: temp = Result_3rd*mult; //Assign 3rd Byte
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:401: result = result + temp;
	mov	a,r2
	add	a,r7
	mov	dpl,a
	mov	a,r3
	addc	a,r0
	mov	dph,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:411: return result;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readBits'
;------------------------------------------------------------
;select                    Allocated to registers r2 r3 
;num                       Allocated to registers r4 r5 
;num2                      Allocated to registers r3 r7 
;sloc0                     Allocated with name '_readBits_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:415: unsigned int readBits(int select)
;	-----------------------------------------
;	 function readBits
;	-----------------------------------------
_readBits:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:417: unsigned int num = 0, num2 = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:418: bit stable = 0;
	clr	_readBits_stable_1_98
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:420: while(stable == 0){
	clr	a
	cjne	r2,#0x01,L010021?
	cjne	r3,#0x00,L010021?
	inc	a
L010021?:
	mov	_readBits_sloc0_1_0,a
	clr	a
	cjne	r2,#0x02,L010023?
	cjne	r3,#0x00,L010023?
	inc	a
L010023?:
	mov	r2,a
L010010?:
	jnb	_readBits_stable_1_98,L010025?
	ljmp	L010012?
L010025?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:421: if(select == 1){
	mov	a,_readBits_sloc0_1_0
	jnz	L010026?
	ljmp	L010008?
L010026?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:422: num = P2_7*128 + P2_6*64 + P2_5*32 + P2_4*16 + P2_3*8 + P2_2*4 + P2_1*2 + P2_0*1;
	mov	c,_P2_7
	clr	a
	rlc	a
	mov	r3,a
	clr	a
	anl	a,#0x01
	mov	c,acc.0
	xch	a,r3
	rrc	a
	xch	a,r3
	rrc	a
	xch	a,r3
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_0
	clr	a
	rlc	a
	mov	r0,a
	mov	r1,#0x00
	mov	a,r0
	add	a,r3
	mov	r4,a
	mov	a,r1
	addc	a,r7
	mov	r5,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:423: num2 = P2_7*128 + P2_6*64 + P2_5*32 + P2_4*16 + P2_3*8 + P2_2*4 + P2_1*2 + P2_0*1;
	mov	c,_P2_7
	clr	a
	rlc	a
	mov	r3,a
	clr	a
	anl	a,#0x01
	mov	c,acc.0
	xch	a,r3
	rrc	a
	xch	a,r3
	rrc	a
	xch	a,r3
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
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
	add	a,r3
	mov	r3,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
	mov	c,_P2_0
	clr	a
	rlc	a
	mov	r0,a
	mov	r1,#0x00
	mov	a,r0
	add	a,r3
	mov	r3,a
	mov	a,r1
	addc	a,r7
	mov	r7,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:424: if(num == num2)stable=1; 
	mov	a,r4
	cjne	a,ar3,L010027?
	mov	a,r5
	cjne	a,ar7,L010027?
	sjmp	L010028?
L010027?:
	ljmp	L010010?
L010028?:
	setb	_readBits_stable_1_98
	ljmp	L010010?
L010008?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:427: else if(select == 2){    
	mov	a,r2
	jnz	L010029?
	ljmp	L010010?
L010029?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:428: num = P0_7*128 + P0_6*64 + P0_5*32 + P0_4*16 + P0_3*8 + P0_2*4 + P0_1*2 + P0_0*1;
	push	ar2
	mov	c,_P0_7
	clr	a
	rlc	a
	mov	r0,a
	clr	a
	anl	a,#0x01
	mov	c,acc.0
	xch	a,r0
	rrc	a
	xch	a,r0
	rrc	a
	xch	a,r0
	mov	r1,a
	mov	c,_P0_6
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	anl	a,#0x03
	mov	c,acc.0
	xch	a,r2
	rrc	a
	xch	a,r2
	rrc	a
	mov	c,acc.0
	xch	a,r2
	rrc	a
	xch	a,r2
	rrc	a
	xch	a,r2
	mov	r6,a
	mov	a,r2
	add	a,r0
	mov	r0,a
	mov	a,r6
	addc	a,r1
	mov	r1,a
	mov	c,_P0_5
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	swap	a
	rl	a
	anl	a,#0xe0
	xch	a,r2
	swap	a
	rl	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xe0
	xch	a,r2
	xrl	a,r2
	mov	r6,a
	mov	a,r2
	add	a,r0
	mov	r0,a
	mov	a,r6
	addc	a,r1
	mov	r1,a
	mov	c,_P0_4
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	swap	a
	anl	a,#0xf0
	xch	a,r2
	swap	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xf0
	xch	a,r2
	xrl	a,r2
	mov	r6,a
	mov	a,r2
	add	a,r0
	mov	r0,a
	mov	a,r6
	addc	a,r1
	mov	r1,a
	mov	c,_P0_3
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	swap	a
	rr	a
	anl	a,#0xf8
	xch	a,r2
	swap	a
	rr	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xf8
	xch	a,r2
	xrl	a,r2
	mov	r6,a
	mov	a,r2
	add	a,r0
	mov	r0,a
	mov	a,r6
	addc	a,r1
	mov	r1,a
	mov	c,_P0_2
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	mov	r6,a
	mov	a,r2
	add	a,r0
	mov	r0,a
	mov	a,r6
	addc	a,r1
	mov	r1,a
	mov	c,_P0_1
	clr	a
	rlc	a
	mov	r2,a
	clr	a
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	mov	r6,a
	mov	a,r2
	add	a,r0
	mov	r0,a
	mov	a,r6
	addc	a,r1
	mov	r1,a
	mov	c,_P0_0
	clr	a
	rlc	a
	mov	r2,a
	mov	r6,#0x00
	mov	a,r2
	add	a,r0
	mov	r4,a
	mov	a,r6
	addc	a,r1
	mov	r5,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:429: num2 = P0_7*128 + P0_6*64 + P0_5*32 + P0_4*16 + P0_3*8 + P0_2*4 + P0_1*2 + P0_0*1;
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
	mov	r6,a
	mov	c,_P0_6
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
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	c,_P0_5
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
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	c,_P0_4
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
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	c,_P0_3
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
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	c,_P0_2
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
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	c,_P0_1
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
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	c,_P0_0
	clr	a
	rlc	a
	mov	r0,a
	mov	r1,#0x00
	mov	a,r0
	add	a,r2
	mov	r3,a
	mov	a,r1
	addc	a,r6
	mov	r7,a
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:430: if(num == num2)stable=1;
	mov	a,r4
	cjne	a,ar3,L010030?
	mov	a,r5
	cjne	a,ar7,L010030?
	sjmp	L010031?
L010030?:
	pop	ar2
	ljmp	L010010?
L010031?:
	pop	ar2
	setb	_readBits_stable_1_98
	ljmp	L010010?
L010012?:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:433: return num;
	mov	dpl,r4
	mov	dph,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:437: void waitms (void){
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:446: _endasm;
	
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:463: void SPIWrite(unsigned char value)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:464: {   SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA
	anl	_SPSTA,#0x7F
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:465: SPDAT=value;
	mov	_SPDAT,r2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:466: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end
L012001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L012001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:470: unsigned int GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:475: SPCON&=(~SPEN); // Disable SPI
	anl	_SPCON,#0xBF
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:476: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS;
	mov	_SPCON,#0x3F
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:477: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:479: CE=0; // Activate the MCP3004 ADC.
	clr	_P1_4
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:480: SPIWrite(channel|0x18); // Send start bit, single/diff* bit, D2, D1, and D0 bits.
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:481: for(adc=0; adc<10; adc++); // Wait for S/H to setup
	mov	r2,#0x0A
	mov	r3,#0x00
L013003?:
	dec	r2
	cjne	r2,#0xff,L013009?
	dec	r3
L013009?:
	mov	a,r2
	orl	a,r3
	jnz	L013003?
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:482: SPIWrite(0x55); // Read bits 9 down to 4
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:483: adc=((SPDAT&0x3f)*0x100);                   
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:484: SPIWrite(0x55);// Read bits 3 down to 0
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:485: CE=1; // Deactivate the MCP3004 ADC.
	setb	_P1_4
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:486: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:487: adc>>=4;
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
;	C:\Users\Patrick\Desktop\Robot-ArmControl\MK2_StableStephane.c:489: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[%d;%dH'
	db 0x00
__str_1:
	db '%i    '
	db 0x00
__str_2:
	db '%i     '
	db 0x00
__str_3:
	db 0x1B
	db '[0;3%d;4%dm'
	db 0x00
__str_4:
	db 0x1B
	db '[2J'
	db 0x00
__str_5:
	db 'Setpoint Angle   ::: '
	db 0x00
__str_6:
	db 0x0A
	db 'Motor Angle      :::'
	db 0x00
__str_7:
	db 0x0A
	db 'Angular PWM      ::: '
	db 0x00
__str_8:
	db 0x0A
	db 0x0A
	db 'Linear Setpoint  ::: '
	db 0x00
__str_9:
	db 0x0A
	db 'Lin Motor y-Pos  ::: '
	db 0x00
__str_10:
	db 0x0A
	db 'Linear PWM'
	db 0x09
	db '     ::: '
	db 0x00
__str_11:
	db 'Switch 5V'
	db 0x00

	CSEG

end
