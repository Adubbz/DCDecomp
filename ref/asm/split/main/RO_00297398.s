.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297398
/* 197498 00297398 63616C6C */ .word 0x6C6C6163
/* 19749C 0029739C 20636472 */ .word 0x72646320
/* 1974A0 002973A0 65616473 */ .word 0x73646165
/* 1974A4 002973A4 746D2063 */ .word 0x63206D74
/* 1974A8 002973A8 6D640A00 */ .word 0x000A646D
/* 1974AC 002973AC 00000000 */ .word 0x00000000
