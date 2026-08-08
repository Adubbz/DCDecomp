.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2738
/* 19ADD0 0029ACD0 2366756B */ .word 0x6B756623
/* 19ADD4 0029ACD4 69646173 */ .word 0x73616469
/* 19ADD8 0029ACD8 68696261 */ .word 0x61626968
/* 19ADDC 0029ACDC 73652336 */ .word 0x36236573
/* 19ADE0 0029ACE0 34302332 */ .word 0x32233034
/* 19ADE4 0029ACE4 32342334 */ .word 0x34233432
/* 19ADE8 0029ACE8 00000000 */ .word 0x00000000
/* 19ADEC 0029ACEC 00000000 */ .word 0x00000000
