.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2244
/* 19D930 0029D830 6B616765 */ .word 0x6567616B
/* 19D934 0029D834 746F616E */ .word 0x6E616F74
/* 19D938 0029D838 00000000 */ .word 0x00000000
/* 19D93C 0029D83C 00000000 */ .word 0x00000000
