.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_729
/* 199070 00298F70 4D4F5449 */ .word 0x49544F4D
/* 199074 00298F74 4F4E0000 */ .word 0x00004E4F
