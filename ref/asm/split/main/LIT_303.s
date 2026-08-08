.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_303
/* 199F28 00299E28 68756B69 */ .word 0x696B7568
/* 199F2C 00299E2C 64617369 */ .word 0x69736164
/* 199F30 00299E30 00000000 */ .word 0x00000000
/* 199F34 00299E34 00000000 */ .word 0x00000000
