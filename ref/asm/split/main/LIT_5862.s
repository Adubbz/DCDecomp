.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_5862
/* 19DCC0 0029DBC0 6E6F7420 */ .word 0x20746F6E
/* 19DCC4 0029DBC4 746F6B69 */ .word 0x696B6F74
/* 19DCC8 0029DBC8 206E6F20 */ .word 0x206F6E20
/* 19DCCC 0029DBCC 6B616972 */ .word 0x7269616B
/* 19DCD0 0029DBD0 6F750A00 */ .word 0x000A756F
/* 19DCD4 0029DBD4 00000000 */ .word 0x00000000
