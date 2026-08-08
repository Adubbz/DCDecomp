.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_519
/* 19C280 0029C180 5552415F */ .word 0x5F415255
/* 19C284 0029C184 42475F43 */ .word 0x435F4742
/* 19C288 0029C188 4F4C0000 */ .word 0x00004C4F
/* 19C28C 0029C18C 00000000 */ .word 0x00000000
