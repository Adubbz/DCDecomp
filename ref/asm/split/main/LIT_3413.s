.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3413
/* 19EE20 0029ED20 23667261 */ .word 0x61726623
/* 19EE24 0029ED24 6D655F69 */ .word 0x695F656D
/* 19EE28 0029ED28 6D616765 */ .word 0x6567616D
/* 19EE2C 0029ED2C 23363430 */ .word 0x30343623
/* 19EE30 0029ED30 23343438 */ .word 0x38343423
/* 19EE34 0029ED34 23340000 */ .word 0x00003423
