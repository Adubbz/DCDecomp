.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_371__3
/* 19A880 0029A780 43484152 */ .word 0x52414843
/* 19A884 0029A784 415F414D */ .word 0x4D415F41
/* 19A888 0029A788 4249454E */ .word 0x4E454942
/* 19A88C 0029A78C 54000000 */ .word 0x00000054
