.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_936__4
/* 19FE80 0029FD80 64636F6C */ .word 0x6C6F6364
/* 19FE84 0029FD84 30000000 */ .word 0x00000030
