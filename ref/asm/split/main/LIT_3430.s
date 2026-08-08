.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3430
/* 19EE88 0029ED88 6576656E */ .word 0x6E657665
/* 19EE8C 0029ED8C 746D6E75 */ .word 0x756E6D74
/* 19EE90 0029ED90 322E7061 */ .word 0x61702E32
/* 19EE94 0029ED94 6B000000 */ .word 0x0000006B
