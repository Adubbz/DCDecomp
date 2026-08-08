.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2347
/* 19EC18 0029EB18 616C6C6D */ .word 0x6D6C6C61
/* 19EC1C 0029EB1C 656E752E */ .word 0x2E756E65
/* 19EC20 0029EB20 6D657300 */ .word GlobalDataBuffer + 0x48B4ED
/* 19EC24 0029EB24 00000000 */ .word 0x00000000
