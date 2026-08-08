.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298C40
/* 198D40 00298C40 46494E44 */ .word 0x444E4946
/* 198D44 00298C44 43545031 */ .word 0x31505443
/* 198D48 00298C48 00000000 */ .word 0x00000000
/* 198D4C 00298C4C 00000000 */ .word 0x00000000
