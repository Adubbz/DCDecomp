.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_25
/* 199B20 00299A20 6572726F */ .word 0x6F727265
/* 199B24 00299A24 723A2073 */ .word 0x73203A72
/* 199B28 00299A28 63655369 */ .word 0x69536563
/* 199B2C 00299A2C 6642696E */ .word 0x6E694266
/* 199B30 00299A30 64527063 */ .word 0x63705264
/* 199B34 00299A34 200A0000 */ .word 0x00000A20
/* 199B38 00299A38 00000000 */ .word 0x00000000
/* 199B3C 00299A3C 00000000 */ .word 0x00000000
