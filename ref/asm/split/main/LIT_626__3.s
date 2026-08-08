.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_626__3
/* 19C9E8 0029C8E8 7A61746D */ .word 0x6D74617A
/* 19C9EC 0029C8EC 616A6900 */ .word GlobalDataBuffer + 0x3EB9E1
