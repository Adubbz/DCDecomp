.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1200
/* 19E1A0 0029E0A0 63302564 */ .word 0x64253063
/* 19E1A4 0029E0A4 646D656E */ .word 0x6E656D64
/* 19E1A8 0029E0A8 752E6366 */ .word 0x66632E75
/* 19E1AC 0029E0AC 67000000 */ .word 0x00000067
