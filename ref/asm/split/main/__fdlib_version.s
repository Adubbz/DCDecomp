.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel __fdlib_version
/* 198B30 00298A30 01000000 */ .word 0x00000001
/* 198B34 00298A34 00000000 */ .word 0x00000000
