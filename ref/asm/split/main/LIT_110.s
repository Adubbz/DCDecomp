.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_110
/* 19F980 0029F880 6E6F7420 */ .word 0x20746F6E
/* 19F984 0029F884 666F756E */ .word 0x6E756F66
/* 19F988 0029F888 64207072 */ .word 0x72702064
/* 19F98C 0029F88C 6F677261 */ .word 0x6172676F
/* 19F990 0029F890 6D202564 */ .word 0x6425206D
/* 19F994 0029F894 0A000000 */ .word 0x0000000A
/* 19F998 0029F898 00000000 */ .word 0x00000000
/* 19F99C 0029F89C 00000000 */ .word 0x00000000
