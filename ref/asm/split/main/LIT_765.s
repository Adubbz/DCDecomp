.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_765
/* 19C370 0029C270 54414720 */ .word 0x20474154
/* 19C374 0029C274 4D454D20 */ .word 0x204D454D
/* 19C378 0029C278 45525232 */ .word 0x32525245
/* 19C37C 0029C27C 2021210A */ .word 0x0A212120
/* 19C380 0029C280 00000000 */ .word 0x00000000
/* 19C384 0029C284 00000000 */ .word 0x00000000
