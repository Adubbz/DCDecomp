.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296BE0
/* 196CE0 00296BE0 30313233 */ .word 0x33323130
/* 196CE4 00296BE4 34353637 */ .word 0x37363534
/* 196CE8 00296BE8 38394142 */ .word 0x42413938
/* 196CEC 00296BEC 43444546 */ .word 0x46454443
/* 196CF0 00296BF0 00000000 */ .word 0x00000000
/* 196CF4 00296BF4 00000000 */ .word 0x00000000
