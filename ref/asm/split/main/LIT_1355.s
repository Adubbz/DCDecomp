.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1355
/* 19B6B8 0029B5B8 64756E2F */ .word 0x2F6E7564
/* 19B6BC 0029B5BC 6D70645F */ .word 0x5F64706D
/* 19B6C0 0029B5C0 7061636B */ .word 0x6B636170
/* 19B6C4 0029B5C4 2F000000 */ .word 0x0000002F
