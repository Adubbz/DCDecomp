.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_328
/* 19A000 00299F00 796F726F */ .word 0x6F726F79
/* 19A004 00299F04 69000000 */ .word 0x00000069
