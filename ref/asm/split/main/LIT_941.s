.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_941
/* 19D6A8 0029D5A8 61747261 */ .word 0x61727461
/* 19D6AC 0029D5AC 6D65732E */ .word 0x2E73656D
/* 19D6B0 0029D5B0 62696E00 */ .word GlobalDataBuffer + 0x43B8E2
/* 19D6B4 0029D5B4 00000000 */ .word 0x00000000
