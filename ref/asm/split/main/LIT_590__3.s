.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_590__3
/* 19E550 0029E450 616C6C6D */ .word 0x6D6C6C61
/* 19E554 0029E454 656E752E */ .word 0x2E756E65
/* 19E558 0029E458 6D657300 */ .word GlobalDataBuffer + 0x48B4ED
/* 19E55C 0029E45C 00000000 */ .word 0x00000000
