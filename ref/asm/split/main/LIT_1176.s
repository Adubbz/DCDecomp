.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1176
/* 19E150 0029E050 64756E67 */ .word 0x676E7564
/* 19E154 0029E054 656F6E2F */ .word 0x2F6E6F65
/* 19E158 0029E058 00000000 */ .word 0x00000000
/* 19E15C 0029E05C 00000000 */ .word 0x00000000
