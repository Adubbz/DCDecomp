.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2812
/* 19B010 0029AF10 616E6B66 */ .word 0x666B6E61
/* 19B014 0029AF14 6F6E742E */ .word 0x2E746E6F
/* 19B018 0029AF18 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
/* 19B01C 0029AF1C 00000000 */ .word 0x00000000
