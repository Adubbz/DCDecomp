.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel __mprec_tinytens
/* 196B68 00296A68 BC89D897 */ .word 0x97D889BC
/* 196B6C 00296A6C B2D29C3C */ .word 0x3C9CD2B2
/* 196B70 00296A70 33A7A8D5 */ .word 0xD5A8A733
/* 196B74 00296A74 23F64939 */ .word 0x3949F623
/* 196B78 00296A78 3DA7F444 */ .word 0x44F4A73D
/* 196B7C 00296A7C FD0FA532 */ .word 0x32A50FFD
/* 196B80 00296A80 9D978CCF */ .word 0xCF8C979D
/* 196B84 00296A84 08BA5B25 */ .word 0x255BBA08
/* 196B88 00296A88 436FAC64 */ .word 0x64AC6F43
/* 196B8C 00296A8C 2806C80A */ .word 0x0AC80628
