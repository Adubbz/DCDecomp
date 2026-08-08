.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_663
/* 19CBE0 0029CAE0 6B6F6E61 */ .word 0x616E6F6B
/* 19CBE4 0029CAE4 6B617761 */ .word 0x6177616B
/* 19CBE8 0029CAE8 00000000 */ .word 0x00000000
/* 19CBEC 0029CAEC 00000000 */ .word 0x00000000
