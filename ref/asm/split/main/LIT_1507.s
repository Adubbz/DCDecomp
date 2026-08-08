.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1507
/* 19E2C8 0029E1C8 63686172 */ .word 0x72616863
/* 19E2CC 0029E1CC 61666163 */ .word 0x63616661
/* 19E2D0 0029E1D0 65000000 */ .word 0x00000065
/* 19E2D4 0029E1D4 00000000 */ .word 0x00000000
