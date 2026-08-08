.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298A90
/* 198B90 00298A90 6174616E */ .word 0x6E617461
/* 198B94 00298A94 32000000 */ .word 0x00000032
