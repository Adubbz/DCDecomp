.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_703__2
/* 19CDD0 0029CCD0 68616E64 */ .word 0x646E6168
/* 19CDD4 0029CCD4 6F6C0000 */ .word 0x00006C6F
