.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1149
/* 19C3D0 0029C2D0 64656275 */ .word 0x75626564
/* 19C3D4 0029C2D4 67203D20 */ .word 0x203D2067
/* 19C3D8 0029C2D8 25640A00 */ .word 0x000A6425
/* 19C3DC 0029C2DC 00000000 */ .word 0x00000000
