.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_189
/* 199290 00299190 4E4F524D */ .word 0x4D524F4E
/* 199294 00299194 414C0000 */ .word 0x00004C41
