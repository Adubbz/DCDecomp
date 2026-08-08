.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_864
/* 19BC40 0029BB40 2E626270 */ .word 0x7062622E
/* 19BC44 0029BB44 00000000 */ .word 0x00000000
