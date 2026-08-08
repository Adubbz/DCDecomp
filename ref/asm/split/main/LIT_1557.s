.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1557
/* 199B88 00299A88 66756B69 */ .word 0x696B7566
/* 199B8C 00299A8C 32353600 */ .word GlobalDataBuffer + 0xB84B2
