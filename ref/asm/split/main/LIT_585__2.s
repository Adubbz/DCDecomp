.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_585__2
/* 19E520 0029E420 616E6162 */ .word 0x62616E61
/* 19E524 0029E424 61720000 */ .word 0x00007261
