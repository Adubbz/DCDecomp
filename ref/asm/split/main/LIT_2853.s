.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2853
/* 19B0C0 0029AFC0 6D6F6F6E */ .word 0x6E6F6F6D
/* 19B0C4 0029AFC4 00000000 */ .word 0x00000000
