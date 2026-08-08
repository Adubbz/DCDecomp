.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_510__2
/* 19C1F8 0029C0F8 44554D4D */ .word 0x4D4D5544
/* 19C1FC 0029C0FC 595F4D4F */ .word 0x4F4D5F59
/* 19C200 0029C100 44454C00 */ .word GlobalDataBuffer + 0x2194C4
/* 19C204 0029C104 00000000 */ .word 0x00000000
