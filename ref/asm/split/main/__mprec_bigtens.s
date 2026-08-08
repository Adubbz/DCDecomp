.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel __mprec_bigtens
/* 196B40 00296A40 0080E037 */ .word 0x37E08000
/* 196B44 00296A44 79C34143 */ .word 0x4341C379
/* 196B48 00296A48 176E05B5 */ .word 0xB5056E17
/* 196B4C 00296A4C B5B89346 */ .word 0x4693B8B5
/* 196B50 00296A50 F5F93FE9 */ .word 0xE93FF9F5
/* 196B54 00296A54 034F384D */ .word 0x4D384F03
/* 196B58 00296A58 321D30F9 */ .word 0xF9301D32
/* 196B5C 00296A5C 4877825A */ .word 0x5A827748
/* 196B60 00296A60 3CBF737F */ .word 0x7F73BF3C
/* 196B64 00296A64 DD4F1575 */ .word 0x75154FDD
