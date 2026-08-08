.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_364
/* 19A828 0029A728 534F554E */ .word 0x4E554F53
/* 19A82C 0029A72C 445F5345 */ .word 0x45535F44
/* 19A830 0029A730 54000000 */ .word 0x00000054
/* 19A834 0029A734 00000000 */ .word 0x00000000
