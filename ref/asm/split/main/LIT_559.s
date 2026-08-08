.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_559
/* 19F250 0029F150 615F7370 */ .word 0x70735F61
/* 19F254 0029F154 612F0000 */ .word 0x00002F61
/* 19F258 0029F158 00000000 */ .word 0x00000000
/* 19F25C 0029F15C 00000000 */ .word 0x00000000
