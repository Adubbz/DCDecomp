.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_252
/* 198F38 00298E38 25736925 */ .word 0x25697325
/* 198F3C 00298E3C 35642E74 */ .word 0x742E6435
/* 198F40 00298E40 67610000 */ .word 0x00006167
/* 198F44 00298E44 00000000 */ .word 0x00000000
