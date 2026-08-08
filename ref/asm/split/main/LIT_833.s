.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_833
/* 19BE48 0029BD48 6F766572 */ .word 0x7265766F
/* 19BE4C 0029BD4C 20657272 */ .word 0x72726520
/* 19BE50 0029BD50 0A000000 */ .word 0x0000000A
/* 19BE54 0029BD54 00000000 */ .word 0x00000000
/* 19BE58 0029BD58 00000000 */ .word 0x00000000
/* 19BE5C 0029BD5C 00000000 */ .word 0x00000000
