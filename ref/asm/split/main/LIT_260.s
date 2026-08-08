.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_260
/* 199D70 00299C70 62656E63 */ .word 0x636E6562
/* 199D74 00299C74 68690000 */ .word 0x00006968
