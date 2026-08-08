.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1007
/* 199670 00299570 696D675F */ .word 0x5F676D69
/* 199674 00299574 312F6D65 */ .word 0x656D2F31
/* 199678 00299578 6D6F7279 */ .word 0x79726F6D
/* 19967C 0029957C 2E696D67 */ .word 0x676D692E
/* 199680 00299580 00000000 */ .word 0x00000000
/* 199684 00299584 00000000 */ .word 0x00000000
/* 199688 00299588 00000000 */ .word 0x00000000
/* 19968C 0029958C 00000000 */ .word 0x00000000
