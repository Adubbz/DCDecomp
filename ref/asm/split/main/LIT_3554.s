.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3554
/* 19EEF0 0029EDF0 4D697373 */ .word 0x7373694D
/* 19EEF4 0029EDF4 0973656C */ .word 0x6C657309
/* 19EEF8 0029EDF8 65637465 */ .word 0x65746365
/* 19EEFC 0029EDFC 64206974 */ .word 0x74692064
/* 19EF00 0029EE00 656D4E6F */ .word 0x6F4E6D65
/* 19EF04 0029EE04 203D2025 */ .word 0x25203D20
/* 19EF08 0029EE08 640A0000 */ .word 0x00000A64
/* 19EF0C 0029EE0C 00000000 */ .word 0x00000000
