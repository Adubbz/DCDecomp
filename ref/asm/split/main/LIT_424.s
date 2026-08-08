.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_424
/* 198DE0 00298CE0 21737464 */ .word 0x64747321
/* 198DE4 00298CE4 3A3A6261 */ .word 0x61623A3A
/* 198DE8 00298CE8 645F6578 */ .word 0x78655F64
/* 198DEC 00298CEC 63657074 */ .word 0x74706563
/* 198DF0 00298CF0 696F6E21 */ .word 0x216E6F69
/* 198DF4 00298CF4 21000000 */ .word 0x00000021
/* 198DF8 00298CF8 00000000 */ .word 0x00000000
/* 198DFC 00298CFC 00000000 */ .word 0x00000000
