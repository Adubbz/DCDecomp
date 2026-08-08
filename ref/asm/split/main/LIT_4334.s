.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_4334
/* 19DB80 0029DA80 73746174 */ .word 0x74617473
/* 19DB84 0029DA84 75730000 */ .word 0x00007375
/* 19DB88 0029DA88 00000000 */ .word 0x00000000
/* 19DB8C 0029DA8C 00000000 */ .word 0x00000000
