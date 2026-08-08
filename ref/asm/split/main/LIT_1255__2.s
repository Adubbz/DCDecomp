.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1255__2
/* 19F060 0029EF60 6672616D */ .word 0x6D617266
/* 19F064 0029EF64 65000000 */ .word 0x00000065
/* 19F068 0029EF68 00000000 */ .word 0x00000000
/* 19F06C 0029EF6C 00000000 */ .word 0x00000000
