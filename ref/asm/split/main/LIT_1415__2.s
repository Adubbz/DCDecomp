.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1415__2
/* 19EB48 0029EA48 6F627065 */ .word 0x6570626F
/* 19EB4C 0029EA4C 72736F6E */ .word 0x6E6F7372
/* 19EB50 0029EA50 00000000 */ .word 0x00000000
/* 19EB54 0029EA54 00000000 */ .word 0x00000000
