.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_892__4
/* 19CFA0 0029CEA0 636F6465 */ .word 0x65646F63
/* 19CFA4 0029CEA4 203D2025 */ .word 0x25203D20
/* 19CFA8 0029CEA8 642C206C */ .word 0x6C202C64
/* 19CFAC 0029CEAC 6F636B20 */ .word 0x206B636F
/* 19CFB0 0029CEB0 3D202564 */ .word 0x6425203D
/* 19CFB4 0029CEB4 0A000000 */ .word 0x0000000A
