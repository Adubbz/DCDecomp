.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297F28
/* 198028 00297F28 9A999999 */ .word 0x9999999A
/* 19802C 00297F2C 9999B93F */ .word 0x3FB99999
