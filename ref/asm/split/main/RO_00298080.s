.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298080
/* 198180 00298080 726F6D30 */ .word 0x306D6F72
/* 198184 00298084 3A55444E */ .word 0x4E44553A
/* 198188 00298088 4C200000 */ .word 0x0000204C
/* 19818C 0029808C 00000000 */ .word 0x00000000
