.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel two24
/* 1983F8 002982F8 00000000 */ .word 0x00000000
/* 1983FC 002982FC 00007041 */ .word 0x41700000
