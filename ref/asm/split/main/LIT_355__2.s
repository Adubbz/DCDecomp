.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_355__2
/* 19B598 0029B498 756B692E */ .word 0x2E696B75
/* 19B59C 0029B49C 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
