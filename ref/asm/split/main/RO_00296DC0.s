.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296DC0
/* 196EC0 00296DC0 30313233 */ .word 0x33323130
/* 196EC4 00296DC4 34353637 */ .word 0x37363534
/* 196EC8 00296DC8 38396162 */ .word 0x62613938
/* 196ECC 00296DCC 63646566 */ .word 0x66656463
/* 196ED0 00296DD0 00000000 */ .word 0x00000000
/* 196ED4 00296DD4 00000000 */ .word 0x00000000
