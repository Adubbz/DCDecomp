.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_730
/* 199078 00298F78 53484144 */ .word 0x44414853
/* 19907C 00298F7C 4F575F4D */ .word 0x4D5F574F
/* 199080 00298F80 4F54494F */ .word 0x4F49544F
/* 199084 00298F84 4E000000 */ .word 0x0000004E
