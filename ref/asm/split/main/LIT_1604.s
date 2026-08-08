.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1604
/* 19B4F0 0029B3F0 4D4F5449 */ .word 0x49544F4D
/* 19B4F4 0029B3F4 4F4E5F50 */ .word 0x505F4E4F
/* 19B4F8 0029B3F8 41525453 */ .word 0x53545241
/* 19B4FC 0029B3FC 00000000 */ .word 0x00000000
