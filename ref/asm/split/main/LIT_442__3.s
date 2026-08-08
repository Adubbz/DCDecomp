.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_442__3
/* 19AA18 0029A918 5F25642E */ .word 0x2E64255F
/* 19AA1C 0029A91C 6D657300 */ .word GlobalDataBuffer + 0x48B4ED
