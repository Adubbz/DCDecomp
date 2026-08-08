.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_388
/* 199200 00299100 6364726F */ .word 0x6F726463
/* 199204 00299104 6D303A5C */ .word 0x5C3A306D
/* 199208 00299108 44415441 */ .word 0x41544144
/* 19920C 0029910C 2E484432 */ .word 0x3244482E
/* 199210 00299110 3B310000 */ .word 0x0000313B
/* 199214 00299114 00000000 */ .word 0x00000000
/* 199218 00299118 00000000 */ .word 0x00000000
/* 19921C 0029911C 00000000 */ .word 0x00000000
