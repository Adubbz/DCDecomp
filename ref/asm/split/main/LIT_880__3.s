.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_880__3
/* 19CF88 0029CE88 72656D6F */ .word 0x6F6D6572
/* 19CF8C 0029CE8C 76652021 */ .word 0x21206576
/* 19CF90 0029CE90 210A0000 */ .word 0x00000A21
/* 19CF94 0029CE94 00000000 */ .word 0x00000000
/* 19CF98 0029CE98 00000000 */ .word 0x00000000
/* 19CF9C 0029CE9C 00000000 */ .word 0x00000000
