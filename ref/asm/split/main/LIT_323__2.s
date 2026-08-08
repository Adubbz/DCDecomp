.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_323__2
/* 19A628 0029A528 4752445F */ .word 0x5F445247
/* 19A62C 0029A52C 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
