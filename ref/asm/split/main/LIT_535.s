.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_535
/* 19F420 0029F320 6D6E6375 */ .word 0x75636E6D
/* 19F424 0029F324 72736F72 */ .word 0x726F7372
/* 19F428 0029F328 00000000 */ .word 0x00000000
/* 19F42C 0029F32C 00000000 */ .word 0x00000000
