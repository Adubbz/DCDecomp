.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_410
/* 198FE8 00298EE8 25732025 */ .word 0x25207325
/* 198FEC 00298EEC 640A0000 */ .word 0x00000A64
