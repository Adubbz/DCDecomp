.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3551
/* 19EEC8 0029EDC8 66697368 */ .word 0x68736966
/* 19EECC 0029EDCC 6D6E7500 */ .word GlobalDataBuffer + 0x4ABDED
