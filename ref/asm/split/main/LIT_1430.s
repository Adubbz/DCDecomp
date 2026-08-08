.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1430
/* 19B7F8 0029B6F8 62617365 */ .word 0x65736162
/* 19B7FC 0029B6FC 66783030 */ .word 0x30307866
/* 19B800 0029B700 00000000 */ .word 0x00000000
/* 19B804 0029B704 00000000 */ .word 0x00000000
/* 19B808 0029B708 00000000 */ .word 0x00000000
/* 19B80C 0029B70C 00000000 */ .word 0x00000000
