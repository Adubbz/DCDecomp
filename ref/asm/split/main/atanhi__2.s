.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel atanhi__2
/* 198B38 00298A38 3863ED3E */ .word 0x3EED6338
/* 198B3C 00298A3C DA0F493F */ .word 0x3F490FDA
/* 198B40 00298A40 5E987B3F */ .word 0x3F7B985E
/* 198B44 00298A44 DA0FC93F */ .word 0x3FC90FDA
