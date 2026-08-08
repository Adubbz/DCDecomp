.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_467
/* 199270 00299170 686F7374 */ .word 0x74736F68
/* 199274 00299174 00000000 */ .word 0x00000000
