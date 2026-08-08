.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1872
/* 19AD00 0029AC00 706E706C */ .word 0x6C706E70
/* 19AD04 0029AC04 61746500 */ .word GlobalDataBuffer + 0x3AC3E1
