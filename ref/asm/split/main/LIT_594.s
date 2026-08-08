.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_594
/* 19A910 0029A810 2573732E */ .word 0x2E737325
/* 19A914 0029A814 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
