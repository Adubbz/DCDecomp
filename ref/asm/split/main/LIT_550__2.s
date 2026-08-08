.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_550__2
/* 19C2E8 0029C1E8 2F2F0000 */ .word 0x00002F2F
/* 19C2EC 0029C1EC 00000000 */ .word 0x00000000
