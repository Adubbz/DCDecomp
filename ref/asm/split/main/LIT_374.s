.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_374
/* 19A8B0 0029A7B0 50454F50 */ .word 0x504F4550
/* 19A8B4 0029A7B4 4C455F4C */ .word 0x4C5F454C
/* 19A8B8 0029A7B8 49535400 */ .word GlobalDataBuffer + 0x29A2C9
/* 19A8BC 0029A7BC 00000000 */ .word 0x00000000
