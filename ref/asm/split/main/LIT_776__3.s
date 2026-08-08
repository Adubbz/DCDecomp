.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_776__3
/* 19EFF0 0029EEF0 23667261 */ .word 0x61726623
/* 19EFF4 0029EEF4 6D655F6D */ .word 0x6D5F656D
/* 19EFF8 0029EEF8 656E755F */ .word 0x5F756E65
/* 19EFFC 0029EEFC 656E7465 */ .word 0x65746E65
/* 19F000 0029EF00 72233634 */ .word 0x34362372
/* 19F004 0029EF04 30233434 */ .word 0x34342330
/* 19F008 0029EF08 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19F00C 0029EF0C 00000000 */ .word 0x00000000
