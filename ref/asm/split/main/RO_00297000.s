.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297000
/* 197100 00297000 65652063 */ .word 0x63206565
/* 197104 00297004 616C6C20 */ .word 0x206C6C61
/* 197108 00297008 636D6420 */ .word 0x20646D63
/* 19710C 0029700C 73656172 */ .word 0x72616573
/* 197110 00297010 63682025 */ .word 0x25206863
/* 197114 00297014 730A0000 */ .word 0x00000A73
