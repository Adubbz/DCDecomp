.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298AA0
/* 198BA0 00298AA0 00000000 */ .word 0x00000000
/* 198BA4 00298AA4 0000F87F */ .word 0x7FF80000
