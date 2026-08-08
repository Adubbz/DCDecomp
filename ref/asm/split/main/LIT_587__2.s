.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_587__2
/* 19E530 0029E430 76696C6E */ .word 0x6E6C6976
/* 19E534 0029E434 616D6500 */ .word GlobalDataBuffer + 0x3ABCE1
