.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_292
/* 199EA0 00299DA0 62657475 */ .word 0x75746562
/* 199EA4 00299DA4 202D6530 */ .word 0x30652D20
/* 199EA8 00299DA8 33683034 */ .word 0x34306833
/* 199EAC 00299DAC 5F73202D */ .word 0x2D20735F
/* 199EB0 00299DB0 65303368 */ .word 0x68333065
/* 199EB4 00299DB4 30346300 */ .word GlobalDataBuffer + 0x3883B0
