.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2810
/* 19AFF0 0029AEF0 73797374 */ .word 0x74737973
/* 19AFF4 0029AEF4 656D2E69 */ .word 0x692E6D65
/* 19AFF8 0029AEF8 6D670000 */ .word 0x0000676D
/* 19AFFC 0029AEFC 00000000 */ .word 0x00000000
