.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_251__2
/* 199D10 00299C10 656E746F */ .word 0x6F746E65
/* 199D14 00299C14 74750000 */ .word 0x00007574
