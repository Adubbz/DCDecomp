.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2750
/* 19AED0 0029ADD0 23666F6E */ .word 0x6E6F6623
/* 19AED4 0029ADD4 745F6275 */ .word 0x75625F74
/* 19AED8 0029ADD8 66662336 */ .word 0x36236666
/* 19AEDC 0029ADDC 34302332 */ .word 0x32233034
/* 19AEE0 0029ADE0 32342334 */ .word 0x34233432
/* 19AEE4 0029ADE4 00000000 */ .word 0x00000000
