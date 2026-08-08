.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_500__2
/* 19C178 0029C078 4445465F */ .word 0x5F464544
/* 19C17C 0029C07C 454E4453 */ .word 0x53444E45
/* 19C180 0029C080 00000000 */ .word 0x00000000
/* 19C184 0029C084 00000000 */ .word 0x00000000
