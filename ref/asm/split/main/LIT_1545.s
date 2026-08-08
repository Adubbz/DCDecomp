.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1545
/* 19B9D8 0029B8D8 4D41494E */ .word 0x4E49414D
/* 19B9DC 0029B8DC 00000000 */ .word 0x00000000
