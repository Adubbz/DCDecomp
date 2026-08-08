.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_5320
/* 19DBB0 0029DAB0 04552000 */ .word .L00205504
/* 19DBB4 0029DAB4 2C552000 */ .word .L0020552C
/* 19DBB8 0029DAB8 3C552000 */ .word .L0020553C
/* 19DBBC 0029DABC EC572000 */ .word .L002057EC
/* 19DBC0 0029DAC0 84562000 */ .word .L00205684
/* 19DBC4 0029DAC4 54552000 */ .word .L00205554
/* 19DBC8 0029DAC8 00000000 */ .word 0x00000000
/* 19DBCC 0029DACC 00000000 */ .word 0x00000000
