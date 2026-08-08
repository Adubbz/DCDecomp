.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_254
/* 1992D0 002991D0 756E6B6E */ .word 0x6E6B6E75
/* 1992D4 002991D4 6F776E20 */ .word 0x206E776F
/* 1992D8 002991D8 636F6D6D */ .word 0x6D6D6F63
/* 1992DC 002991DC 616E6421 */ .word 0x21646E61
/* 1992E0 002991E0 210A0000 */ .word 0x00000A21
/* 1992E4 002991E4 00000000 */ .word 0x00000000
