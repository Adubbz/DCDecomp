.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_249
/* 199890 00299790 416C6C6F */ .word 0x6F6C6C41
/* 199894 00299794 63496F70 */ .word 0x706F4963
/* 199898 00299798 48656170 */ .word 0x70616548
/* 19989C 0029979C 20256420 */ .word 0x20642520
/* 1998A0 002997A0 0A000000 */ .word 0x0000000A
/* 1998A4 002997A4 00000000 */ .word 0x00000000
