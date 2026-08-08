.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_858
/* 19F4E0 0029F3E0 65666665 */ .word 0x65666665
/* 19F4E4 0029F3E4 63742073 */ .word 0x73207463
/* 19F4E8 0029F3E8 6E642073 */ .word 0x7320646E
/* 19F4EC 0029F3EC 697A6520 */ .word 0x20657A69
/* 19F4F0 0029F3F0 3D202564 */ .word 0x6425203D
/* 19F4F4 0029F3F4 0A000000 */ .word 0x0000000A
