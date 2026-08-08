.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1415
/* 19B7F0 0029B6F0 656D6421 */ .word 0x21646D65
/* 19B7F4 0029B6F4 210A0000 */ .word 0x00000A21
