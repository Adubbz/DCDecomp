.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_337__2
/* 19A6B8 0029A5B8 57415445 */ .word 0x45544157
/* 19A6BC 0029A5BC 525F5348 */ .word 0x48535F52
/* 19A6C0 0029A5C0 414B4500 */ .word GlobalDataBuffer + 0x1A9AC1
/* 19A6C4 0029A5C4 00000000 */ .word 0x00000000
