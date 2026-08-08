.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_273
/* 199DD8 00299CD8 646F6132 */ .word 0x32616F64
/* 199DDC 00299CDC 202D646F */ .word 0x6F642D20
/* 199DE0 00299CE0 61310000 */ .word 0x00003161
/* 199DE4 00299CE4 00000000 */ .word 0x00000000
