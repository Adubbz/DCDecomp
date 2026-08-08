.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_874
/* 1994E0 002993E0 7469746C */ .word 0x6C746974
/* 1994E4 002993E4 65000000 */ .word 0x00000065
/* 1994E8 002993E8 00000000 */ .word 0x00000000
/* 1994EC 002993EC 00000000 */ .word 0x00000000
