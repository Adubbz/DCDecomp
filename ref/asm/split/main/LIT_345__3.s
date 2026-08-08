.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_345__3
/* 19A730 0029A630 52495645 */ .word 0x45564952
/* 19A734 0029A634 52000000 */ .word 0x00000052
