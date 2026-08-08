.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_648__2
/* 19CB10 0029CA10 62616B75 */ .word 0x756B6162
/* 19CB14 0029CA14 64616E00 */ .word GlobalDataBuffer + 0x43B0E4
