.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298A28
/* 198B28 00298A28 9C750088 */ .word 0x8800759C
/* 198B2C 00298A2C 3CE4377E */ .word 0x7E37E43C
