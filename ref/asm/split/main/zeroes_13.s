.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel zeroes_13
/* 196CB0 00296BB0 30303030 */ .word 0x30303030
/* 196CB4 00296BB4 30303030 */ .word 0x30303030
/* 196CB8 00296BB8 30303030 */ .word 0x30303030
/* 196CBC 00296BBC 30303030 */ .word 0x30303030
