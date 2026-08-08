.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_361__2
/* 19A800 0029A700 53484144 */ .word 0x44414853
/* 19A804 0029A704 4F575F4C */ .word 0x4C5F574F
/* 19A808 0029A708 4556454C */ .word 0x4C455645
/* 19A80C 0029A70C 00000000 */ .word 0x00000000
