.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_328__2
/* 19A1E8 0029A0E8 616C7068 */ .word 0x68706C61
/* 19A1EC 0029A0EC 61303100 */ .word GlobalDataBuffer + 0x67FE1
