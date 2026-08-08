.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3095
/* 19EDF0 0029ECF0 73617665 */ .word 0x65766173
/* 19EDF4 0029ECF4 00000000 */ .word 0x00000000
/* 19EDF8 0029ECF8 00000000 */ .word 0x00000000
/* 19EDFC 0029ECFC 00000000 */ .word 0x00000000
