.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_450
/* 19A2A0 0029A1A0 5445585F */ .word 0x5F584554
/* 19A2A4 0029A1A4 5343524F */ .word 0x4F524353
/* 19A2A8 0029A1A8 4C4C5F44 */ .word 0x445F4C4C
/* 19A2AC 0029A1AC 41544100 */ .word GlobalDataBuffer + 0x16A3C1
