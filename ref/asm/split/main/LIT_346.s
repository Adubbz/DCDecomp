.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_346
/* 19A738 0029A638 42524944 */ .word 0x44495242
/* 19A73C 0029A63C 47455F50 */ .word 0x505F4547
/* 19A740 0029A640 41525453 */ .word 0x53545241
/* 19A744 0029A644 00000000 */ .word 0x00000000
