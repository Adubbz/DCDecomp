.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1182
/* 19BD88 0029BC88 656C656D */ .word 0x6D656C65
/* 19BD8C 0029BC8C 656E7400 */ .word GlobalDataBuffer + 0x49BDE5
