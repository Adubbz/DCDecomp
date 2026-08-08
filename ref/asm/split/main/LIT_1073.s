.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1073
/* 19F2C8 0029F1C8 70657262 */ .word 0x62726570
/* 19F2CC 0029F1CC 72640000 */ .word 0x00006472
