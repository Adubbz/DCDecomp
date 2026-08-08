.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_332__2
/* 19A020 00299F20 6274756E */ .word 0x6E757462
/* 19A024 00299F24 6F000000 */ .word 0x0000006F
