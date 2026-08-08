.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_395__2
/* 19A1F0 0029A0F0 66785F66 */ .word 0x665F7866
/* 19A1F4 0029A0F4 6F6F7400 */ .word GlobalDataBuffer + 0x49BEEF
