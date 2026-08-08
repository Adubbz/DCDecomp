.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_979
/* 199B10 00299A10 4D494449 */ .word 0x4944494D
/* 199B14 00299A14 2073746F */ .word 0x6F747320
/* 199B18 00299A18 70212025 */ .word 0x25202170
/* 199B1C 00299A1C 640A0000 */ .word 0x00000A64
