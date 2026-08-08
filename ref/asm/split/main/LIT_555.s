.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_555
/* 19F230 0029F130 615F656E */ .word 0x6E655F61
/* 19F234 0029F134 672F0000 */ .word 0x00002F67
