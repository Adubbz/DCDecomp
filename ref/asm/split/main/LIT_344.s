.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_344
/* 19A720 0029A620 52495645 */ .word 0x45564952
/* 19A724 0029A624 525F5041 */ .word 0x41505F52
/* 19A728 0029A628 52545300 */ .word GlobalDataBuffer + 0x28A3D2
/* 19A72C 0029A62C 00000000 */ .word 0x00000000
