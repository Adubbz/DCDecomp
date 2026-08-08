.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_640__2
/* 19C690 0029C590 64636F6C */ .word 0x6C6F6364
/* 19C694 0029C594 30000000 */ .word 0x00000030
