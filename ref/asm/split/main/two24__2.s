.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel two24__2
/* 198958 00298858 00000000 */ .word 0x00000000
/* 19895C 0029885C 00007041 */ .word 0x41700000
