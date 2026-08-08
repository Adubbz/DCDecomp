.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_882
/* 19A9D0 0029A8D0 4543484F */ .word 0x4F484345
/* 19A9D4 0029A8D4 00000000 */ .word 0x00000000
