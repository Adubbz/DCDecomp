.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_190
/* 199298 00299198 464F4C4C */ .word 0x4C4C4F46
/* 19929C 0029919C 4F570000 */ .word 0x0000574F
