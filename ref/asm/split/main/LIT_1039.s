.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1039
/* 198E78 00298D78 6261645F */ .word 0x5F646162
/* 198E7C 00298D7C 65786365 */ .word 0x65637865
/* 198E80 00298D80 7074696F */ .word 0x6F697470
/* 198E84 00298D84 6E000000 */ .word 0x0000006E
