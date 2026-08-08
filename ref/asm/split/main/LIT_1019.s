.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1019
/* 19F510 0029F410 6D617264 */ .word 0x6472616D
/* 19F514 0029F414 616E206E */ .word 0x6E206E61
/* 19F518 0029F418 756D2063 */ .word 0x63206D75
/* 19F51C 0029F41C 6C656172 */ .word 0x7261656C
/* 19F520 0029F420 21210A00 */ .word 0x000A2121
/* 19F524 0029F424 00000000 */ .word 0x00000000
