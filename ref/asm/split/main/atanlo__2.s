.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel atanlo__2
/* 198B48 00298A48 6937AC31 */ .word 0x31AC3769
/* 198B4C 00298A4C 68212233 */ .word 0x33222168
/* 198B50 00298A50 B40F1433 */ .word 0x33140FB4
/* 198B54 00298A54 6821A233 */ .word 0x33A22168
