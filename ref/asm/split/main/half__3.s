.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel half__3
/* 198968 00298868 00000000 */ .word 0x00000000
/* 19896C 0029886C 0000E03F */ .word 0x3FE00000
