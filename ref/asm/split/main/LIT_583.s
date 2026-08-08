.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_583
/* 19E500 0029E400 65646974 */ .word 0x74696465
/* 19E504 0029E404 6D656E75 */ .word 0x756E656D
/* 19E508 0029E408 2E696D67 */ .word 0x676D692E
/* 19E50C 0029E40C 00000000 */ .word 0x00000000
