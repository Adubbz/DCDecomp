.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_873
/* 1994D8 002993D8 65303100 */ .word GlobalDataBuffer + 0x67FE5
/* 1994DC 002993DC 00000000 */ .word 0x00000000
