.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6222
/* 19DDB0 0029DCB0 71756565 */ .word 0x65657571
/* 19DDB4 0029DCB4 6E2E7061 */ .word 0x61702E6E
/* 19DDB8 0029DCB8 63000000 */ .word 0x00000063
/* 19DDBC 0029DCBC 00000000 */ .word 0x00000000
