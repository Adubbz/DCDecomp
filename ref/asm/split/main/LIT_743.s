.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_743
/* 199140 00299040 4556454E */ .word 0x4E455645
/* 199144 00299044 54000000 */ .word 0x00000054
