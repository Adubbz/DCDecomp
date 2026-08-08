.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_285__3
/* 199E60 00299D60 69726967 */ .word 0x67697269
/* 199E64 00299D64 75746920 */ .word 0x20697475
/* 199E68 00299D68 2D746F62 */ .word 0x626F742D
/* 199E6C 00299D6C 69726100 */ .word GlobalDataBuffer + 0x36C1E9
