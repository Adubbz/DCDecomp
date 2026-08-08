.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1361
/* 19B710 0029B610 69626F78 */ .word 0x786F6269
/* 19B714 0029B614 5F742E6D */ .word 0x6D2E745F
/* 19B718 0029B618 64730000 */ .word 0x00007364
/* 19B71C 0029B61C 00000000 */ .word 0x00000000
