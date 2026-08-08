.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_468
/* 199278 00299178 686F7374 */ .word 0x74736F68
/* 19927C 0029917C 3A000000 */ .word 0x0000003A
