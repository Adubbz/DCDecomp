.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_736__2
/* 19ABB0 0029AAB0 6D657377 */ .word 0x7773656D
/* 19ABB4 0029AAB4 696E2F73 */ .word 0x732F6E69
/* 19ABB8 0029AAB8 79737465 */ .word 0x65747379
/* 19ABBC 0029AABC 6D313465 */ .word 0x6534316D
/* 19ABC0 0029AAC0 2E62696E */ .word 0x6E69622E
/* 19ABC4 0029AAC4 00000000 */ .word 0x00000000
