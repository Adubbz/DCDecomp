.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_811
/* 19C3C0 0029C2C0 66697265 */ .word 0x65726966
/* 19C3C4 0029C2C4 2E696D67 */ .word 0x676D692E
/* 19C3C8 0029C2C8 00000000 */ .word 0x00000000
/* 19C3CC 0029C2CC 00000000 */ .word 0x00000000
