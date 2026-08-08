.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_987
/* 19DF68 0029DE68 6B616765 */ .word 0x6567616B
/* 19DF6C 0029DE6C 676F726F */ .word 0x6F726F67
/* 19DF70 0029DE70 00000000 */ .word 0x00000000
/* 19DF74 0029DE74 00000000 */ .word 0x00000000
