.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1560
/* 19BF58 0029BE58 626C656E */ .word 0x6E656C62
/* 19BF5C 0029BE5C 64657200 */ .word GlobalDataBuffer + 0x47B4E4
