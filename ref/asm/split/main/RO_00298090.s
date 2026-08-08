.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298090
/* 198190 00298090 746F6F20 */ .word 0x206F6F74
/* 198194 00298094 6C6F6E67 */ .word 0x676E6F6C
/* 198198 00298098 20706172 */ .word 0x72617020
/* 19819C 0029809C 616D6574 */ .word 0x74656D61
/* 1981A0 002980A0 65722027 */ .word 0x27207265
/* 1981A4 002980A4 2573270A */ .word 0x0A277325
/* 1981A8 002980A8 00000000 */ .word 0x00000000
/* 1981AC 002980AC 00000000 */ .word 0x00000000
