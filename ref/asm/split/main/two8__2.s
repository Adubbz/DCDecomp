.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel two8__2
/* 198A1C 0029891C 00008043 */ .word 0x43800000
