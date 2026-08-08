.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1311
/* 19D1F8 0029D0F8 616E696D */ .word 0x6D696E61
/* 19D1FC 0029D0FC 4F6E2025 */ .word 0x25206E4F
/* 19D200 0029D100 640A0000 */ .word 0x00000A64
/* 19D204 0029D104 00000000 */ .word 0x00000000
