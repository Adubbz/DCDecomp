.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_278
/* 199E10 00299D10 686F6E65 */ .word 0x656E6F68
/* 199E14 00299D14 202D6830 */ .word 0x30682D20
/* 199E18 00299D18 375F6300 */ .word GlobalDataBuffer + 0x38AEB7
/* 199E1C 00299D1C 00000000 */ .word 0x00000000
