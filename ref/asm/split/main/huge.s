.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel huge
/* 196BA8 00296AA8 9C750088 */ .word 0x8800759C
/* 196BAC 00296AAC 3CE4377E */ .word 0x7E37E43C
