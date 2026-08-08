.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_195
/* 1992C8 002991C8 424F554E */ .word 0x4E554F42
/* 1992CC 002991CC 44000000 */ .word 0x00000044
