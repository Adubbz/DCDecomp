.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_589__3
/* 19E540 0029E440 61747261 */ .word 0x61727461
/* 19E544 0029E444 6D65732E */ .word 0x2E73656D
/* 19E548 0029E448 62696E00 */ .word GlobalDataBuffer + 0x43B8E2
/* 19E54C 0029E44C 00000000 */ .word 0x00000000
