.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_390
/* 199238 00299138 6574632E */ .word 0x2E637465
/* 19923C 0029913C 63707000 */ .word GlobalDataBuffer + 0x45BFE3
