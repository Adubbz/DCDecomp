.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_341
/* 19A6F8 0029A5F8 50415254 */ .word 0x54524150
/* 19A6FC 0029A5FC 535F494E */ .word 0x4E495F53
/* 19A700 0029A600 464F0000 */ .word 0x00004F46
/* 19A704 0029A604 00000000 */ .word 0x00000000
