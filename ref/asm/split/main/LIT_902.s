.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_902
/* 19C7F8 0029C6F8 696E666F */ .word 0x6F666E69
/* 19C7FC 0029C6FC 2E636667 */ .word 0x6766632E
/* 19C800 0029C700 00000000 */ .word 0x00000000
/* 19C804 0029C704 00000000 */ .word 0x00000000
/* 19C808 0029C708 00000000 */ .word 0x00000000
/* 19C80C 0029C70C 00000000 */ .word 0x00000000
