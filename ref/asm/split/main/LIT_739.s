.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_739
/* 199110 00299010 414C4C4F */ .word 0x4F4C4C41
/* 199114 00299014 435F5348 */ .word 0x48535F43
/* 199118 00299018 41444F57 */ .word 0x574F4441
/* 19911C 0029901C 5F444255 */ .word 0x5542445F
/* 199120 00299020 46460000 */ .word 0x00004646
/* 199124 00299024 00000000 */ .word 0x00000000
