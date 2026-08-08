.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_891
/* 1995E8 002994E8 6F70656E */ .word 0x6E65706F
/* 1995EC 002994EC 696E6700 */ .word GlobalDataBuffer + 0x3CBDE9
