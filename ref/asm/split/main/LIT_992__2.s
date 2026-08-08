.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_992__2
/* 19DFA0 0029DEA0 63303100 */ .word GlobalDataBuffer + 0x67FE3
/* 19DFA4 0029DEA4 00000000 */ .word 0x00000000
