.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel twom54
/* 196BA0 00296AA0 00000000 */ .word 0x00000000
/* 196BA4 00296AA4 0000903C */ .word 0x3C900000
