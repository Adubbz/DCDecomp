.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1190
/* 19EA30 0029E930 66696C65 */ .word 0x656C6966
/* 19EA34 0029E934 206E6F74 */ .word 0x746F6E20
/* 19EA38 0029E938 206F7065 */ .word 0x65706F20
/* 19EA3C 0029E93C 6E206F72 */ .word 0x726F206E
/* 19EA40 0029E940 206E6F74 */ .word 0x746F6E20
/* 19EA44 0029E944 20657869 */ .word 0x69786520
/* 19EA48 0029E948 73740A00 */ .word 0x000A7473
/* 19EA4C 0029E94C 00000000 */ .word 0x00000000
