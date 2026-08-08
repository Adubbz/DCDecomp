.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel blanks_12
/* 196CA0 00296BA0 20202020 */ .word 0x20202020
/* 196CA4 00296BA4 20202020 */ .word 0x20202020
/* 196CA8 00296BA8 20202020 */ .word 0x20202020
/* 196CAC 00296BAC 20202020 */ .word 0x20202020
