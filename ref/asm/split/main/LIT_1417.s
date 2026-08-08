.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1417
/* 19EB60 0029EA60 76696C6E */ .word 0x6E6C6976
/* 19EB64 0029EA64 616D6500 */ .word GlobalDataBuffer + 0x3ABCE1
