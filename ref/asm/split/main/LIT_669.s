.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_669
/* 19CC38 0029CB38 6564656E */ .word 0x6E656465
/* 19CC3C 0029CB3C 66757274 */ .word 0x74727566
/* 19CC40 0029CB40 00000000 */ .word 0x00000000
/* 19CC44 0029CB44 00000000 */ .word 0x00000000
