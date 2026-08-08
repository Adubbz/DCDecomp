.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_738
/* 1990F0 00298FF0 414C4C4F */ .word 0x4F4C4C41
/* 1990F4 00298FF4 435F5348 */ .word 0x48535F43
/* 1990F8 00298FF8 41444F57 */ .word 0x574F4441
/* 1990FC 00298FFC 5F4D4454 */ .word 0x54444D5F
/* 199100 00299000 00000000 */ .word 0x00000000
/* 199104 00299004 00000000 */ .word 0x00000000
/* 199108 00299008 00000000 */ .word 0x00000000
/* 19910C 0029900C 00000000 */ .word 0x00000000
