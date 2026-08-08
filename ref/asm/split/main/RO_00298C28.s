.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298C28
/* 198D28 00298C28 4552524F */ .word 0x4F525245
/* 198D2C 00298C2C 52000000 */ .word 0x00000052
