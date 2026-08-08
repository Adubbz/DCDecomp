.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_449
/* 19A290 0029A190 5445585F */ .word 0x5F584554
/* 19A294 0029A194 414E494D */ .word 0x4D494E41
/* 19A298 0029A198 455F4441 */ .word 0x41445F45
/* 19A29C 0029A19C 54413200 */ .word GlobalDataBuffer + 0x790D4
