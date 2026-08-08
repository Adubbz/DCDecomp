.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_590__2
/* 19C600 0029C500 64756E2F */ .word 0x2F6E7564
/* 19C604 0029C504 6D61696E */ .word 0x6E69616D
/* 19C608 0029C508 63686172 */ .word 0x72616863
/* 19C60C 0029C50C 612F6331 */ .word 0x31632F61
/* 19C610 0029C510 38612E63 */ .word 0x632E6138
/* 19C614 0029C514 68720000 */ .word 0x00007268
