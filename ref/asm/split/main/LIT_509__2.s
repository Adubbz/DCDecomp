.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_509__2
/* 19C1E8 0029C0E8 42475F4D */ .word 0x4D5F4742
/* 19C1EC 0029C0EC 4F44454C */ .word 0x4C45444F
/* 19C1F0 0029C0F0 00000000 */ .word 0x00000000
/* 19C1F4 0029C0F4 00000000 */ .word 0x00000000
