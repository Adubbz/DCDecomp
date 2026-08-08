.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1551
/* 19BA00 0029B900 504F4953 */ .word 0x53494F50
/* 19BA04 0029B904 4F4E0000 */ .word 0x00004E4F
