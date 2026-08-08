.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2236
/* 19B200 0029B100 706F6C79 */ .word 0x796C6F70
/* 19B204 0029B104 5F6E756D */ .word 0x6D756E5F
/* 19B208 0029B108 203D2025 */ .word 0x25203D20
/* 19B20C 0029B10C 640A0000 */ .word 0x00000A64
