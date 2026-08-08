.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1363
/* 19B730 0029B630 69626F78 */ .word 0x786F6269
/* 19B734 0029B634 735F302E */ .word 0x2E305F73
/* 19B738 0029B638 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
/* 19B73C 0029B63C 00000000 */ .word 0x00000000
