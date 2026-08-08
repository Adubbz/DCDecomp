.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_785
/* 19F740 0029F640 616C7068 */ .word 0x68706C61
/* 19F744 0029F644 61626574 */ .word 0x74656261
/* 19F748 0029F648 00000000 */ .word 0x00000000
/* 19F74C 0029F64C 00000000 */ .word 0x00000000
