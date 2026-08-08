.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_274
/* 199DE8 00299CE8 6B6F7961 */ .word 0x61796F6B
/* 199DEC 00299CEC 202D6830 */ .word 0x30682D20
/* 199DF0 00299CF0 345F6300 */ .word GlobalDataBuffer + 0x38AEB4
/* 199DF4 00299CF4 00000000 */ .word 0x00000000
