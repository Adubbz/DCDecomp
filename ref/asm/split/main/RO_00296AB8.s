.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296AB8
/* 196BB8 00296AB8 59F3F8C2 */ .word 0xC2F8F359
/* 196BBC 00296ABC 1F6EA501 */ .word GlobalDataBuffer + 0x17ABD9F
