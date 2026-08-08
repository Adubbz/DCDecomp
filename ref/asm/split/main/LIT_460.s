.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_460
/* 1998A8 002997A8 534E445F */ .word 0x5F444E53
/* 1998AC 002997AC 494E463D */ .word 0x3D464E49
/* 1998B0 002997B0 20257320 */ .word 0x20732520
/* 1998B4 002997B4 0A000000 */ .word 0x0000000A
/* 1998B8 002997B8 00000000 */ .word 0x00000000
/* 1998BC 002997BC 00000000 */ .word 0x00000000
