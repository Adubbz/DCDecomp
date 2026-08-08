.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_5861
/* 19DCA8 0029DBA8 6E6F7420 */ .word 0x20746F6E
/* 19DCAC 0029DBAC 636C6561 */ .word 0x61656C63
/* 19DCB0 0029DBB0 72200A00 */ .word 0x000A2072
/* 19DCB4 0029DBB4 00000000 */ .word 0x00000000
/* 19DCB8 0029DBB8 00000000 */ .word 0x00000000
/* 19DCBC 0029DBBC 00000000 */ .word 0x00000000
