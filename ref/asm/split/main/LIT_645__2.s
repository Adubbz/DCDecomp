.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_645__2
/* 19CAF0 0029C9F0 73656B6B */ .word 0x6B6B6573
/* 19CAF4 0029C9F4 656E0000 */ .word 0x00006E65
