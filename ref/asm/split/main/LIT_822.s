.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_822
/* 199B70 00299A70 25640A00 */ .word 0x000A6425
/* 199B74 00299A74 00000000 */ .word 0x00000000
