.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_788__2
/* 19F770 0029F670 6E616D65 */ .word 0x656D616E
/* 19F774 0029F674 72656769 */ .word 0x69676572
/* 19F778 0029F678 322E6269 */ .word 0x69622E32
/* 19F77C 0029F67C 6E000000 */ .word 0x0000006E
