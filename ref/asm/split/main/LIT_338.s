.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_338
/* 19A6C8 0029A5C8 45444954 */ .word 0x54494445
/* 19A6CC 0029A5CC 41524541 */ .word 0x41455241
/* 19A6D0 0029A5D0 00000000 */ .word 0x00000000
/* 19A6D4 0029A5D4 00000000 */ .word 0x00000000
