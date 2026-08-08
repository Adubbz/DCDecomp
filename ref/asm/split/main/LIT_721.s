.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_721
/* 19AA90 0029A990 67656469 */ .word 0x69646567
/* 19AA94 0029A994 742F696E */ .word 0x6E692F74
/* 19AA98 0029A998 74657269 */ .word 0x69726574
/* 19AA9C 0029A99C 6F722F6D */ .word 0x6D2F726F
/* 19AAA0 0029A9A0 6170696E */ .word 0x6E697061
/* 19AAA4 0029A9A4 666F2E63 */ .word 0x632E6F66
/* 19AAA8 0029A9A8 66670000 */ .word 0x00006766
/* 19AAAC 0029A9AC 00000000 */ .word 0x00000000
