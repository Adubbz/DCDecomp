.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2823
/* 19EC80 0029EB80 63686563 */ .word 0x63656863
/* 19EC84 0029EB84 6B20656E */ .word 0x6E65206B
/* 19EC88 0029EB88 64202121 */ .word 0x21212064
/* 19EC8C 0029EB8C 0A000000 */ .word 0x0000000A
