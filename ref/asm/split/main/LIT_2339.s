.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2339
/* 19BFB0 0029BEB0 4552523A */ .word 0x3A525245
/* 19BFB4 0029BEB4 20557053 */ .word 0x53705520
/* 19BFB8 0029BEB8 74616972 */ .word 0x72696174
/* 19BFBC 0029BEBC 21210A00 */ .word 0x000A2121
