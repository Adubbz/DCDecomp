.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2346
/* 19EC10 0029EB10 6F707469 */ .word 0x6974706F
/* 19EC14 0029EB14 6F6E3200 */ .word GlobalDataBuffer + 0x7BDEF
