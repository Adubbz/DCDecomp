.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1703
/* 19A310 0029A210 6D617275 */ .word 0x7572616D
/* 19A314 0029A214 5F756B69 */ .word 0x696B755F
/* 19A318 0029A218 00000000 */ .word 0x00000000
/* 19A31C 0029A21C 00000000 */ .word 0x00000000
