.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_408
/* 198FB0 00298EB0 74657874 */ .word 0x74786574
/* 198FB4 00298EB4 75726520 */ .word 0x20657275
/* 198FB8 00298EB8 62756666 */ .word 0x66667562
/* 198FBC 00298EBC 6572206F */ .word 0x6F207265
/* 198FC0 00298EC0 76657221 */ .word 0x21726576
/* 198FC4 00298EC4 210A0000 */ .word 0x00000A21
/* 198FC8 00298EC8 00000000 */ .word 0x00000000
/* 198FCC 00298ECC 00000000 */ .word 0x00000000
