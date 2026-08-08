.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_302__2
/* 19A580 0029A480 70353261 */ .word 0x61323570
/* 19A584 0029A484 00000000 */ .word 0x00000000
