.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1548
/* 19B9E8 0029B8E8 52455345 */ .word 0x45534552
/* 19B9EC 0029B8EC 54000000 */ .word 0x00000054
