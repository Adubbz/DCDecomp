.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_996
/* 19C830 0029C730 64756E2F */ .word 0x2F6E7564
/* 19C834 0029C734 65666665 */ .word 0x65666665
/* 19C838 0029C738 63742F65 */ .word 0x652F7463
/* 19C83C 0029C73C 73636170 */ .word 0x70616373
/* 19C840 0029C740 652E6368 */ .word 0x68632E65
/* 19C844 0029C744 72000000 */ .word 0x00000072
