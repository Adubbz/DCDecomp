.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_692__2
/* 19CD50 0029CC50 676B6579 */ .word 0x79656B67
/* 19CD54 0029CC54 5F647300 */ .word GlobalDataBuffer + 0x48B3DF
