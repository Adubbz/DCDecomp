.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2610
/* 19B300 0029B200 20616E67 */ .word 0x676E6120
/* 19B304 0029B204 6C65203D */ .word 0x3D20656C
/* 19B308 0029B208 2025342E */ .word 0x2E342520
/* 19B30C 0029B20C 33660A00 */ .word 0x000A6633
