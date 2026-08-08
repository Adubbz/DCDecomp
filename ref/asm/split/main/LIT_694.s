.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_694
/* 19CD60 0029CC60 6D696B61 */ .word 0x616B696D
/* 19CD64 0029CC64 7A756B69 */ .word 0x696B757A
/* 19CD68 0029CC68 00000000 */ .word 0x00000000
/* 19CD6C 0029CC6C 00000000 */ .word 0x00000000
