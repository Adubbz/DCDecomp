.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_404
/* 19E6D8 0029E5D8 50533244 */ .word 0x44325350
/* 19E6DC 0029E5DC 00000000 */ .word 0x00000000
