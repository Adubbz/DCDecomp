.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_370__2
/* 19A870 0029A770 54414C4B */ .word 0x4B4C4154
/* 19A874 0029A774 5F455645 */ .word 0x4556455F
/* 19A878 0029A778 4E540000 */ .word 0x0000544E
/* 19A87C 0029A77C 00000000 */ .word 0x00000000
