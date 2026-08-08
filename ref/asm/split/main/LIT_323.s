.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_323
/* 199FD8 00299ED8 6E616974 */ .word 0x7469616E
/* 199FDC 00299EDC 6F000000 */ .word 0x0000006F
