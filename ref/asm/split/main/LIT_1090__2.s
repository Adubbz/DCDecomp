.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1090__2
/* 19E930 0029E830 73617665 */ .word 0x65766173
/* 19E934 0029E834 20646174 */ .word 0x74616420
/* 19E938 0029E838 61206272 */ .word 0x72622061
/* 19E93C 0029E83C 65616B21 */ .word 0x216B6165
/* 19E940 0029E840 21210A00 */ .word 0x000A2121
/* 19E944 0029E844 00000000 */ .word 0x00000000
