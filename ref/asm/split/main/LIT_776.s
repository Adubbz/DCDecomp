.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_776
/* 199158 00299058 6572726F */ .word 0x6F727265
/* 19915C 0029905C 72212120 */ .word 0x20212172
/* 199160 00299060 61742025 */ .word 0x25207461
/* 199164 00299064 730A0000 */ .word 0x00000A73
