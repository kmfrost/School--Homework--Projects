#include "hidef.h"      /* common defines and macros */
#include "derivative.h"      /* derivative-specific definitions */
#include "MC9S12C32.h"	/* derivative-specific definitions */

/*-------------------------------------------*/
/* Markus Kreitzer and Steven Motes				*/
/* ELEC 3040/3050 - Lab 1, Program 1          */ 
/* Toggle LED1 while SW1 is pressed with a    */  
/* short delay.                              */
/*-------------------------------------------*/


/* Defines PORTA, DDRA: LED1 LED1 connected to PA0 */
/* Defines PORTE, DDRE: SW1 connected to PE0 */

char count = 0;

/*Delay function*/
void delay() {
	/* 8.19 ms per TOF */
	/* We need 61 overflows */
	int tcount = 61;
	while(tcount != 0){
		if( TFLG2_TOF == 1 ){
			tcount--;
			//TSCR2_TCRE = 1;
			TFLG2_TOF  = 1;
		}
	}
}
// Count function
void counting( char dir ){
	if(count < 0){
		count = 9;
	}
	if(count > 9){
		count = 0;
	}
	if( dir ){
		count--;
	}
  else{
		count++;
	}
	PTT = (count & 0x0F);
}



void main(void){
	//TSCR2_TCRE  = 1;
	TSCR1_TEN   = 1;
	// TFLG2_TOF   = 1;
	

 	DDRA        = 0x00;
	DDRB        = 0x00;
	DDRT        = 0xFF;
  
	while(1){
		// sw1 = PORTA_BIT0;
		while ( PORTA_BIT0 ) {
		  delay();
			// sw2 = PORTB_BIT4;
			counting( PORTB_BIT4 );
		}
	}
}