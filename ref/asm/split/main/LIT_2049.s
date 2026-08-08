.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2049
/* 19F1C0 0029F0C0 68656C70 */ .word 0x706C6568
/* 19F1C4 0029F0C4 496E6465 */ .word 0x65646E49
/* 19F1C8 0029F0C8 783A2564 */ .word 0x64253A78
/* 19F1CC 0029F0CC 0A000000 */ .word 0x0000000A
