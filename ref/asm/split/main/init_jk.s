.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel init_jk
/* 1988F8 002987F8 02000000 */ .word 0x00000002
/* 1988FC 002987FC 03000000 */ .word 0x00000003
/* 198900 00298800 04000000 */ .word 0x00000004
/* 198904 00298804 06000000 */ .word 0x00000006
