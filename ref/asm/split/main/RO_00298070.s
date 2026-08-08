.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298070
/* 198170 00298070 2E2E2E2E */ .word 0x2E2E2E2E
/* 198174 00298074 00000000 */ .word 0x00000000
