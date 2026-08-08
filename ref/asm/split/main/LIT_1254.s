.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1254
/* 19E280 0029E180 23667261 */ .word 0x61726623
/* 19E284 0029E184 6D655F69 */ .word 0x695F656D
/* 19E288 0029E188 6D616765 */ .word 0x6567616D
/* 19E28C 0029E18C 23363430 */ .word 0x30343623
/* 19E290 0029E190 23343438 */ .word 0x38343423
/* 19E294 0029E194 23340000 */ .word 0x00003423
/* 19E298 0029E198 00000000 */ .word 0x00000000
/* 19E29C 0029E19C 00000000 */ .word 0x00000000
