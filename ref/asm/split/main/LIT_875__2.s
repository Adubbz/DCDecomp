.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_875__2
/* 19A980 0029A880 4F464600 */ .word GlobalDataBuffer + 0x1B95CF
/* 19A984 0029A884 00000000 */ .word 0x00000000
