.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_340
/* 19A6E8 0029A5E8 4752445F */ .word 0x5F445247
/* 19A6EC 0029A5EC 50415254 */ .word 0x54524150
/* 19A6F0 0029A5F0 53000000 */ .word 0x00000053
/* 19A6F4 0029A5F4 00000000 */ .word 0x00000000
