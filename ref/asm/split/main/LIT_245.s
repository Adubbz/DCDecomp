.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_245
/* 198DC8 00298CC8 65786365 */ .word 0x65637865
/* 198DCC 00298CCC 7074696F */ .word 0x6F697470
/* 198DD0 00298CD0 6E000000 */ .word 0x0000006E
/* 198DD4 00298CD4 00000000 */ .word 0x00000000
/* 198DD8 00298CD8 00000000 */ .word 0x00000000
/* 198DDC 00298CDC 00000000 */ .word 0x00000000
