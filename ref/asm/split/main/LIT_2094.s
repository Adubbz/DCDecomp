.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2094
/* 199C78 00299B78 73746179 */ .word 0x79617473
/* 199C7C 00299B7C 6672616D */ .word 0x6D617266
/* 199C80 00299B80 65000000 */ .word 0x00000065
/* 199C84 00299B84 00000000 */ .word 0x00000000
