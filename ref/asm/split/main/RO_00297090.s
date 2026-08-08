.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297090
/* 197190 00297090 63616C6C */ .word 0x6C6C6163
/* 197194 00297094 20436452 */ .word 0x52644320
/* 197198 00297098 65616443 */ .word 0x43646165
/* 19719C 0029709C 6861696E */ .word 0x6E696168
/* 1971A0 002970A0 20636D64 */ .word 0x646D6320
/* 1971A4 002970A4 20300A00 */ .word 0x000A3020
