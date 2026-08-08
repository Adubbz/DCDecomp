.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_990__2
/* 19DF98 0029DE98 6B616765 */ .word 0x6567616B
/* 19DF9C 0029DE9C 6F7A7500 */ .word GlobalDataBuffer + 0x4AC9EF
