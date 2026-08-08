.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297338
/* 197438 00297338 73636543 */ .word 0x43656373
/* 19743C 0029733C 64537450 */ .word 0x50745364
/* 197440 00297340 61757365 */ .word 0x65737561
/* 197444 00297344 2063616C */ .word 0x6C616320
/* 197448 00297348 6C0A0000 */ .word 0x00000A6C
/* 19744C 0029734C 00000000 */ .word 0x00000000
