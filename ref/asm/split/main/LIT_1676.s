.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1676
/* 19B1E0 0029B0E0 6C656E73 */ .word 0x736E656C
/* 19B1E4 0029B0E4 666C6572 */ .word 0x72656C66
/* 19B1E8 0029B0E8 00000000 */ .word 0x00000000
/* 19B1EC 0029B0EC 00000000 */ .word 0x00000000
