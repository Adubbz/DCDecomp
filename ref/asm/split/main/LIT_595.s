.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_595
/* 19A918 0029A818 2573612E */ .word 0x2E617325
/* 19A91C 0029A81C 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
