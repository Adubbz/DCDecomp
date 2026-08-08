.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_940__2
/* 19D698 0029D598 62746C6D */ .word 0x6D6C7462
/* 19D69C 0029D59C 656E752E */ .word 0x2E756E65
/* 19D6A0 0029D5A0 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19D6A4 0029D5A4 00000000 */ .word 0x00000000
