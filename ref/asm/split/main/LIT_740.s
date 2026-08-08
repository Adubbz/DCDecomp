.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_740
/* 199128 00299028 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
/* 19912C 0029902C 00000000 */ .word 0x00000000
