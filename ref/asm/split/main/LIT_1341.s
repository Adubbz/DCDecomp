.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1341
/* 19E2B8 0029E1B8 64302564 */ .word 0x64253064
/* 19E2BC 0029E1BC 6F2E696D */ .word 0x6D692E6F
/* 19E2C0 0029E1C0 67000000 */ .word 0x00000067
/* 19E2C4 0029E1C4 00000000 */ .word 0x00000000
