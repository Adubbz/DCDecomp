.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1599
/* 19B4C0 0029B3C0 4F424A5F */ .word 0x5F4A424F
/* 19B4C4 0029B3C4 414E494D */ .word 0x4D494E41
/* 19B4C8 0029B3C8 45000000 */ .word 0x00000045
/* 19B4CC 0029B3CC 00000000 */ .word 0x00000000
