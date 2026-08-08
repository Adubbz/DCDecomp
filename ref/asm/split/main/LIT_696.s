.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_696
/* 19CD80 0029CC80 74616979 */ .word 0x79696174
/* 19CD84 0029CC84 73697273 */ .word 0x73726973
/* 19CD88 0029CC88 00000000 */ .word 0x00000000
/* 19CD8C 0029CC8C 00000000 */ .word 0x00000000
