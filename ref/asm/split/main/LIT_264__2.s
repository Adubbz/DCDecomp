.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_264__2
/* 199D90 00299C90 676F6F64 */ .word 0x646F6F67
/* 199D94 00299C94 73000000 */ .word 0x00000073
