.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6224
/* 19DDD0 0029DCD0 6D6F6F6E */ .word 0x6E6F6F6D
/* 19DDD4 0029DCD4 2E706163 */ .word 0x6361702E
/* 19DDD8 0029DCD8 00000000 */ .word 0x00000000
/* 19DDDC 0029DCDC 00000000 */ .word 0x00000000
