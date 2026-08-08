.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2048
/* 19F1B0 0029F0B0 6E616D65 */ .word 0x656D616E
/* 19F1B4 0029F0B4 496E6465 */ .word 0x65646E49
/* 19F1B8 0029F0B8 783A2564 */ .word 0x64253A78
/* 19F1BC 0029F0BC 0A000000 */ .word 0x0000000A
