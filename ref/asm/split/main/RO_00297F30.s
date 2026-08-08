.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297F30
/* 198030 00297F30 9A999999 */ .word 0x9999999A
/* 198034 00297F34 9999B93F */ .word 0x3FB99999
