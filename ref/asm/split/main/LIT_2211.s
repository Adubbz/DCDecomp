.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2211
/* 19EBD0 0029EAD0 6F707469 */ .word 0x6974706F
/* 19EBD4 0029EAD4 6F6E2E70 */ .word 0x702E6E6F
/* 19EBD8 0029EAD8 61630000 */ .word 0x00006361
/* 19EBDC 0029EADC 00000000 */ .word 0x00000000
