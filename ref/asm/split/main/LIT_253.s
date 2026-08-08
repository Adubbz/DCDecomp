.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_253
/* 199D20 00299C20 646F6F72 */ .word 0x726F6F64
/* 199D24 00299C24 32202D64 */ .word 0x642D2032
/* 199D28 00299C28 6F6F7231 */ .word 0x31726F6F
/* 199D2C 00299C2C 00000000 */ .word 0x00000000
