.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel blanks_12__2
/* 196E90 00296D90 20202020 */ .word 0x20202020
/* 196E94 00296D94 20202020 */ .word 0x20202020
/* 196E98 00296D98 20202020 */ .word 0x20202020
/* 196E9C 00296D9C 20202020 */ .word 0x20202020
