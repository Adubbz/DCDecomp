.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297028
/* 197128 00297028 73656172 */ .word 0x72616573
/* 19712C 0029702C 63682073 */ .word 0x73206863
/* 197130 00297030 697A6520 */ .word 0x20657A69
/* 197134 00297034 25640A00 */ .word 0x000A6425
