.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_705
/* 19CDE8 0029CCE8 666B6579 */ .word 0x79656B66
/* 19CDEC 0029CCEC 5F647300 */ .word GlobalDataBuffer + 0x48B3DF
