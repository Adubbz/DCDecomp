.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_716
/* 19AA58 0029A958 73256400 */ .word GlobalDataBuffer + 0x3974F3
/* 19AA5C 0029A95C 00000000 */ .word 0x00000000
