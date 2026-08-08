.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2741
/* 19AE30 0029AD30 6D657377 */ .word 0x7773656D
/* 19AE34 0029AD34 696E2F66 */ .word 0x662F6E69
/* 19AE38 0029AD38 756B6932 */ .word 0x32696B75
/* 19AE3C 0029AD3C 35362E69 */ .word 0x692E3635
/* 19AE40 0029AD40 6D670000 */ .word 0x0000676D
/* 19AE44 0029AD44 00000000 */ .word 0x00000000
/* 19AE48 0029AD48 00000000 */ .word 0x00000000
/* 19AE4C 0029AD4C 00000000 */ .word 0x00000000
