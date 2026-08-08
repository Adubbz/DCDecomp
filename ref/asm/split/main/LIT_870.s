.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_870
/* 19D138 0029D038 72756E20 */ .word 0x206E7572
/* 19D13C 0029D03C 73637269 */ .word 0x69726373
/* 19D140 0029D040 70742021 */ .word 0x21207470
/* 19D144 0029D044 210A0000 */ .word 0x00000A21
/* 19D148 0029D048 00000000 */ .word 0x00000000
/* 19D14C 0029D04C 00000000 */ .word 0x00000000
