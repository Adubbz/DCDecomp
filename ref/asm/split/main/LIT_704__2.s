.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_704__2
/* 19CDD8 0029CCD8 6B657973 */ .word 0x7379656B
/* 19CDDC 0029CCDC 696B6F6B */ .word 0x6B6F6B69
/* 19CDE0 0029CCE0 00000000 */ .word 0x00000000
/* 19CDE4 0029CCE4 00000000 */ .word 0x00000000
