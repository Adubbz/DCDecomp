.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6221
/* 19DDA0 0029DCA0 6D617461 */ .word 0x6174616D
/* 19DDA4 0029DCA4 74616769 */ .word 0x69676174
/* 19DDA8 0029DCA8 2E706163 */ .word 0x6361702E
/* 19DDAC 0029DCAC 00000000 */ .word 0x00000000
