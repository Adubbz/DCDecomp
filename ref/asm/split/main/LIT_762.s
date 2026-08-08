.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_762
/* 19C320 0029C220 64656620 */ .word 0x20666564
/* 19C324 0029C224 4572726F */ .word 0x6F727245
/* 19C328 0029C228 723A2573 */ .word 0x73253A72
/* 19C32C 0029C22C 0A000000 */ .word 0x0000000A
