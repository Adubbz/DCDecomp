.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296B90
/* 196C90 00296B90 35E5AF35 */ .word 0x35AFE535
/* 196C94 00296B94 0000E03F */ .word 0x3FE00000
