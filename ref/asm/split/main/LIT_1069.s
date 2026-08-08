.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1069
/* 19D1D0 0029D0D0 6E6F7420 */ .word 0x20746F6E
/* 19D1D4 0029D0D4 73686F74 */ .word 0x746F6873
/* 19D1D8 0029D0D8 206E756C */ .word 0x6C756E20
/* 19D1DC 0029D0DC 6C202121 */ .word 0x2121206C
/* 19D1E0 0029D0E0 0A000000 */ .word 0x0000000A
/* 19D1E4 0029D0E4 00000000 */ .word 0x00000000
