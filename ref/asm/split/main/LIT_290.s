.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_290
/* 199CE8 00299BE8 4C356C6F */ .word 0x6F6C354C
/* 199CEC 00299BEC 676F0000 */ .word 0x00006F67
