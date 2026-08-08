.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_593__2
/* 19A908 0029A808 25736D2E */ .word 0x2E6D7325
/* 19A90C 0029A80C 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
