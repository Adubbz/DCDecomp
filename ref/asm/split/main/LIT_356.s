.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_356
/* 19A7B8 0029A6B8 50454F50 */ .word 0x504F4550
/* 19A7BC 0029A6BC 4C450000 */ .word 0x0000454C
