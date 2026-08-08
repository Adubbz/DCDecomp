.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel huge__2
/* 198B10 00298A10 9C750088 */ .word 0x8800759C
/* 198B14 00298A14 3CE4377E */ .word 0x7E37E43C
