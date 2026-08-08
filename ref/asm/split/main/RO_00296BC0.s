.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296BC0
/* 196CC0 00296BC0 30313233 */ .word 0x33323130
/* 196CC4 00296BC4 34353637 */ .word 0x37363534
/* 196CC8 00296BC8 38396162 */ .word 0x62613938
/* 196CCC 00296BCC 63646566 */ .word 0x66656463
/* 196CD0 00296BD0 00000000 */ .word 0x00000000
/* 196CD4 00296BD4 00000000 */ .word 0x00000000
