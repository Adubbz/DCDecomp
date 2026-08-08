.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_351
/* 19A780 0029A680 464C414D */ .word 0x4D414C46
/* 19A784 0029A684 45000000 */ .word 0x00000045
