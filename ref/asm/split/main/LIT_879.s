.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_879
/* 19A9B0 0029A8B0 53545544 */ .word 0x44555453
/* 19A9B4 0029A8B4 494F5F43 */ .word 0x435F4F49
/* 19A9B8 0029A8B8 00000000 */ .word 0x00000000
/* 19A9BC 0029A8BC 00000000 */ .word 0x00000000
