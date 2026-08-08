.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297208
/* 197308 00297208 73746174 */ .word 0x74617473
/* 19730C 0029720C 75732063 */ .word 0x63207375
/* 197310 00297210 616C6C65 */ .word 0x656C6C61
/* 197314 00297214 640A0000 */ .word 0x00000A64
