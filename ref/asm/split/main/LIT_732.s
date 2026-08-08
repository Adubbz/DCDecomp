.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_732
/* 199090 00298F90 4B45595F */ .word 0x5F59454B
/* 199094 00298F94 53544152 */ .word 0x52415453
/* 199098 00298F98 54000000 */ .word 0x00000054
/* 19909C 00298F9C 00000000 */ .word 0x00000000
