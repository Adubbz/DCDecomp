.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3257
/* 19D568 0029D468 66697368 */ .word 0x68736966
/* 19D56C 0029D46C 7265632E */ .word 0x2E636572
/* 19D570 0029D470 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
/* 19D574 0029D474 00000000 */ .word 0x00000000
