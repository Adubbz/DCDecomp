.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_720__2
/* 19CEC0 0029CDC0 686F6E65 */ .word 0x656E6F68
/* 19CEC4 0029CDC4 70656E64 */ .word 0x646E6570
/* 19CEC8 0029CDC8 00000000 */ .word 0x00000000
/* 19CECC 0029CDCC 00000000 */ .word 0x00000000
