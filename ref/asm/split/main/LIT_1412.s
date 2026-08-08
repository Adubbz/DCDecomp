.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1412
/* 19EB20 0029EA20 686F6C65 */ .word 0x656C6F68
/* 19EB24 0029EA24 67726179 */ .word 0x79617267
/* 19EB28 0029EA28 00000000 */ .word 0x00000000
/* 19EB2C 0029EA2C 00000000 */ .word 0x00000000
