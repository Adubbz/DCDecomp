.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_368
/* 19A858 0029A758 53455F41 */ .word 0x415F4553
/* 19A85C 0029A75C 4D424945 */ .word 0x4549424D
/* 19A860 0029A760 4E545F4F */ .word 0x4F5F544E
/* 19A864 0029A764 46460000 */ .word 0x00004646
