.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_888
/* 1995C8 002994C8 25737325 */ .word 0x25737325
/* 1995CC 002994CC 640A0000 */ .word 0x00000A64
