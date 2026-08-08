.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_5858
/* 19DC68 0029DB68 73746179 */ .word 0x79617473
/* 19DC6C 0029DB6C 6672616D */ .word 0x6D617266
/* 19DC70 0029DB70 00000000 */ .word 0x00000000
/* 19DC74 0029DB74 00000000 */ .word 0x00000000
