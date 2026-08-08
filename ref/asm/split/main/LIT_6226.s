.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6226
/* 19DDF0 0029DCF0 6C617374 */ .word 0x7473616C
/* 19DDF4 0029DCF4 646E672E */ .word 0x2E676E64
/* 19DDF8 0029DCF8 70616300 */ .word GlobalDataBuffer + 0x38B0F0
/* 19DDFC 0029DCFC 00000000 */ .word 0x00000000
