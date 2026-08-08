.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_646__2
/* 19BEE0 0029BDE0 65727220 */ .word 0x20727265
/* 19BEE4 0029BDE4 6974656D */ .word 0x6D657469
/* 19BEE8 0029BDE8 626F7820 */ .word 0x20786F62
/* 19BEEC 0029BDEC 6C697374 */ .word 0x7473696C
/* 19BEF0 0029BDF0 200A0000 */ .word 0x00000A20
/* 19BEF4 0029BDF4 00000000 */ .word 0x00000000
