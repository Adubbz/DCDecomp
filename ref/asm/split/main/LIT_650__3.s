.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_650__3
/* 19CB20 0029CA20 6D617365 */ .word 0x6573616D
/* 19CB24 0029CA24 6B696669 */ .word 0x6966696B
/* 19CB28 0029CA28 00000000 */ .word 0x00000000
/* 19CB2C 0029CA2C 00000000 */ .word 0x00000000
