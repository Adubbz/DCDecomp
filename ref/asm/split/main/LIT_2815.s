.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2815
/* 19B040 0029AF40 6269632E */ .word 0x2E636962
/* 19B044 0029AF44 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
