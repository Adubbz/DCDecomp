.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1413
/* 19EB30 0029EA30 686F6C65 */ .word 0x656C6F68
/* 19EB34 0029EA34 676F6C64 */ .word 0x646C6F67
/* 19EB38 0029EA38 00000000 */ .word 0x00000000
/* 19EB3C 0029EA3C 00000000 */ .word 0x00000000
