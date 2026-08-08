.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1397
/* 19EB00 0029EA00 6125642E */ .word 0x2E642561
/* 19EB04 0029EA04 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
