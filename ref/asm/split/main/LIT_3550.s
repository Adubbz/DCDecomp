.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3550
/* 19EEB8 0029EDB8 6576656E */ .word 0x6E657665
/* 19EEBC 0029EDBC 746D6E75 */ .word 0x756E6D74
/* 19EEC0 0029EDC0 00000000 */ .word 0x00000000
/* 19EEC4 0029EDC4 00000000 */ .word 0x00000000
