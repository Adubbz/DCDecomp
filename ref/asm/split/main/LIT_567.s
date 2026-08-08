.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_567
/* 199308 00299208 00000000 */ .word 0x00000000
/* 19930C 0029920C 00000000 */ .word 0x00000000
