.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_863
/* 19BC38 0029BB38 2E6D6473 */ .word 0x73646D2E
/* 19BC3C 0029BB3C 00000000 */ .word 0x00000000
