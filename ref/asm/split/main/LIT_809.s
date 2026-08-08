.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_809
/* 19BE28 0029BD28 25642C25 */ .word 0x252C6425
/* 19BE2C 0029BD2C 64202D2D */ .word 0x2D2D2064
/* 19BE30 0029BD30 3E202564 */ .word 0x6425203E
/* 19BE34 0029BD34 0A000000 */ .word 0x0000000A
