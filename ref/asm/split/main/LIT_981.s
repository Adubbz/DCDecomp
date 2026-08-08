.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_981
/* 19F2B0 0029F1B0 73746179 */ .word 0x79617473
/* 19F2B4 0029F1B4 6672616D */ .word 0x6D617266
/* 19F2B8 0029F1B8 65000000 */ .word 0x00000065
/* 19F2BC 0029F1BC 00000000 */ .word 0x00000000
