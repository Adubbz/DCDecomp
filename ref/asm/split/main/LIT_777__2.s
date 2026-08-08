.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_777__2
/* 19FE78 0029FD78 64636F6C */ .word 0x6C6F6364
/* 19FE7C 0029FD7C 31000000 */ .word 0x00000031
