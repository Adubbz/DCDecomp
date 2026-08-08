.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel one
/* 198890 00298790 00000000 */ .word 0x00000000
/* 198894 00298794 0000F03F */ .word 0x3FF00000
