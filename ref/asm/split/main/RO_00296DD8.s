.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296DD8
/* 196ED8 00296DD8 286E756C */ .word 0x6C756E28
/* 196EDC 00296DDC 6C290000 */ .word 0x0000296C
