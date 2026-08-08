.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_689
/* 19B160 0029B060 6E000000 */ .word 0x0000006E
/* 19B164 0029B064 00000000 */ .word 0x00000000
