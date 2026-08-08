.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_686__2
/* 19CD08 0029CC08 63616E64 */ .word 0x646E6163
/* 19CD0C 0029CC0C 79000000 */ .word 0x00000079
