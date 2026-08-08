.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2249
/* 19D980 0029D880 6B616765 */ .word 0x6567616B
/* 19D984 0029D884 6F7A7500 */ .word GlobalDataBuffer + 0x4AC9EF
/* 19D988 0029D888 00000000 */ .word 0x00000000
/* 19D98C 0029D88C 00000000 */ .word 0x00000000
