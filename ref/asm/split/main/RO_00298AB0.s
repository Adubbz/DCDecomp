.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298AB0
/* 198BB0 00298AB0 6174616E */ .word 0x6E617461
/* 198BB4 00298AB4 32660000 */ .word 0x00006632
