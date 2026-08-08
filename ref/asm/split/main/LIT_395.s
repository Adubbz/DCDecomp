.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_395
/* 198EA8 00298DA8 66756E63 */ .word 0x636E7566
/* 198EAC 00298DAC 5F000000 */ .word 0x0000005F
