#include "hidef.h"      /* common defines and macros */
#include "derivative.h"      /* derivative-specific definitions */
#include "MC9S12C32.h"  /* derivative-specific definitions */

/*-------------------------------------------*/
/* Markus Kreitzer and Steven Motes          */
/* ELEC 3040/3050 - Lab 4                    */
/*                                           */
/* Display two separate counting sequences   */
/* on two sets of 4 LEDS via Port T and AD.  */
/*-------------------------------------------*/

/* Global variables */
 int count1 = 0, count2 = 0;
 int direction = 0; // counting direction for second count: 0 for up, 1 for down, initializes to up


/* Interrupt service routine corresponding to XIRQ# at vector 5.
   Sets direction variable of second count to 1 (count down).   */
interrupt void XIRQ_ISR(void) {
   direction = 1;
}

 
/* Interrupt service routine corresponding to IRQ# at vector 6.
   Sets direction variable of second count to 0 (count up).     */
interrupt void IRQ_ISR(void) {
   direction = 0;
}


/*  Delay function of 500ms by polling TOF flag 61 times */
void delay() {
    // 8.19 ms per TOF 
    // We need 61 overflows 
    int tcount = 61;
	
    while(tcount) {
        if(TFLG2_TOF) {
            tcount--;
            TFLG2_TOF  = 1;
        }
    }
}


/*
 *   First count routine which increases from 0-9 repeatedly and outputs to 4 LEDS on port T.
 *   Count changes approximately every 0.5s and continues throughout the program.
 */
 firstCount() {
     if (count1 < 9) {
       PTT = count1;
       count1++;
     } 
     else {
       PTT = count1;
       count1 = 0;
     }
 }
 
 
/*
 *   Second count routine which increases from 0-9 while direction is 0, and 
 *   decreases from 9 to 0 while direction is 1. The direction variable is changed
 *   to 1 via the XIRQ# pin and to 0 via the IRQ# pin.
 *   Count changes approximately every 1s and continues throughout the program.
 *   Switch 1 -> XIRQ# ->
 *   Switch 2 -> IRQ#
 */
 secondCount() {
     // Count down if direction is non-zero.
     if (direction) {
        if (count2 > 0) {
            PTAD = count2;
            count2--;
        } 
        else {
            PTAD = count2;
            count2 = 9;
        }
     }
     // Otherwise, count up if direction = 0 
     else {
        if (count2 < 9) {
            PTAD = count2;
            count2++;
        } 
        else {
            PTAD = count2;
            count2 = 0;
        }
     }
 }
 
 
/*
 *   Main Routine:
 *   Executes a continuous loop, displaying two separate counts on 2 sets of 4 LEDS.
 *   Count 1   -> PORT T
 *   Count 2   -> PORT AD
 */
void main(void) {
   DDRT         = 0xFF;
   DDRAD        = 0xFF;
   TSCR1_TEN    = 1;  // to enable timer for delay function
   INTCR_IRQEN  = 1;  // enable IRQ# interrupts
   INTCR_IRQE   = 1;  // edge-triggered IRQ# interrupts
   __asm ANDCC #0xBF
   EnableInterrupts;
   
   // continuous loop
   while (1) {
      firstCount();
      delay();
      firstCount();
      secondCount();
      delay();    
   }
}
