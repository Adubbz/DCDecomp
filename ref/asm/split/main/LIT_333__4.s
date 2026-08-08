.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_333__4
/* 19A690 0029A590 47524F55 */ .word 0x554F5247
/* 19A694 0029A594 4E440000 */ .word 0x0000444E
