.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_318
/* 199FB0 00299EB0 6B616E6D */ .word 0x6D6E616B
/* 199FB4 00299EB4 75726900 */ .word GlobalDataBuffer + 0x3EC1F5
