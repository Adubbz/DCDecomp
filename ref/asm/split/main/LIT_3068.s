.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3068
/* 19ED90 0029EC90 616C7068 */ .word 0x68706C61
/* 19ED94 0029EC94 61626574 */ .word 0x74656261
/* 19ED98 0029EC98 00000000 */ .word 0x00000000
/* 19ED9C 0029EC9C 00000000 */ .word 0x00000000
