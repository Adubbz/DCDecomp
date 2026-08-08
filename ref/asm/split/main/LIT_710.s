.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_710
/* 19CE30 0029CD30 6B657968 */ .word 0x6879656B
/* 19CE34 0029CD34 69747567 */ .word 0x67757469
/* 19CE38 0029CD38 00000000 */ .word 0x00000000
/* 19CE3C 0029CD3C 00000000 */ .word 0x00000000
