.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_778
/* 19B640 0029B540 73746179 */ .word 0x79617473
/* 19B644 0029B544 6672616D */ .word 0x6D617266
/* 19B648 0029B548 65000000 */ .word 0x00000065
/* 19B64C 0029B54C 00000000 */ .word 0x00000000
