.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_610__2
/* 19C908 0029C808 6A75656C */ .word 0x6C65756A
/* 19C90C 0029C80C 72756279 */ .word 0x79627572
/* 19C910 0029C810 00000000 */ .word 0x00000000
/* 19C914 0029C814 00000000 */ .word 0x00000000
