.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_511
/* 19BBF8 0029BAF8 64756E2F */ .word 0x2F6E7564
/* 19BBFC 0029BAFC 696D672F */ .word 0x2F676D69
/* 19BC00 0029BB00 6A702F00 */ .word GlobalDataBuffer + 0x4BFEA
/* 19BC04 0029BB04 00000000 */ .word 0x00000000
