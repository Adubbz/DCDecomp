.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002970F0
/* 1971F0 002970F0 63616C6C */ .word 0x6C6C6163
/* 1971F4 002970F4 20436452 */ .word 0x52644320
/* 1971F8 002970F8 65616443 */ .word 0x43646165
/* 1971FC 002970FC 6861696E */ .word 0x6E696168
/* 197200 00297100 20636D64 */ .word 0x646D6320
/* 197204 00297104 20320A00 */ .word 0x000A3220
