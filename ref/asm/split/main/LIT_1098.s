.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1098
/* 19F560 0029F460 776C6576 */ .word 0x76656C77
/* 19F564 0029F464 656C7570 */ .word 0x70756C65
/* 19F568 0029F468 00000000 */ .word 0x00000000
/* 19F56C 0029F46C 00000000 */ .word 0x00000000
