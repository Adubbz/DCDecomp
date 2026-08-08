.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_389
/* 199220 00299120 46696C65 */ .word 0x656C6946
/* 199224 00299124 206F7065 */ .word 0x65706F20
/* 199228 00299128 6E206572 */ .word 0x7265206E
/* 19922C 0029912C 726F7220 */ .word 0x20726F72
/* 199230 00299130 22220A20 */ .word 0x200A2222
/* 199234 00299134 0A200A00 */ .word 0x000A200A
