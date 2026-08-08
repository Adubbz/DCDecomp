.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2850
/* 19B0A8 0029AFA8 73756E31 */ .word 0x316E7573
/* 19B0AC 0029AFAC 00000000 */ .word 0x00000000
