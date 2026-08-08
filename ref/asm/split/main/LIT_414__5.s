.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_414__5
/* 19AA10 0029A910 5F256400 */ .word GlobalDataBuffer + 0x3974DF
/* 19AA14 0029A914 00000000 */ .word 0x00000000
