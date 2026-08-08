.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_890
/* 1995E0 002994E0 64756E67 */ .word 0x676E7564
/* 1995E4 002994E4 656F6E00 */ .word GlobalDataBuffer + 0x43BEE5
