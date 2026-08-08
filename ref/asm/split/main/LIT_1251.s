.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1251
/* 19E270 0029E170 64636F6C */ .word 0x6C6F6364
/* 19E274 0029E174 31000000 */ .word 0x00000031
/* 19E278 0029E178 00000000 */ .word 0x00000000
/* 19E27C 0029E17C 00000000 */ .word 0x00000000
