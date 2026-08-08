.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_736
/* 1990C8 00298FC8 414C4C4F */ .word 0x4F4C4C41
/* 1990CC 00298FCC 435F4D44 */ .word 0x444D5F43
/* 1990D0 00298FD0 54000000 */ .word 0x00000054
/* 1990D4 00298FD4 00000000 */ .word 0x00000000
