.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_179
/* 198EF0 00298DF0 4552524F */ .word 0x4F525245
/* 198EF4 00298DF4 523A2073 */ .word 0x73203A52
/* 198EF8 00298DF8 63655061 */ .word 0x61506563
/* 198EFC 00298DFC 64506F72 */ .word 0x726F5064
/* 198F00 00298E00 744F7065 */ .word 0x65704F74
/* 198F04 00298E04 6E0A0000 */ .word 0x00000A6E
