.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel huge__3
/* 198B20 00298A20 9C750088 */ .word 0x8800759C
/* 198B24 00298A24 3CE4377E */ .word 0x7E37E43C
