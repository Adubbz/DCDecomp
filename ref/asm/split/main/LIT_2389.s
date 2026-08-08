.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2389
/* 19AD68 0029AC68 2573696E */ .word 0x6E697325
/* 19AD6C 0029AC6C 2F25732F */ .word 0x2F73252F
/* 19AD70 0029AC70 25732573 */ .word 0x73257325
/* 19AD74 0029AC74 00000000 */ .word 0x00000000
