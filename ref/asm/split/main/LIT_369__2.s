.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_369__2
/* 19A370 0029A270 686F7374 */ .word 0x74736F68
/* 19A374 0029A274 303A6465 */ .word 0x65643A30
/* 19A378 0029A278 6275672E */ .word 0x2E677562
/* 19A37C 0029A27C 74787400 */ .word GlobalDataBuffer + 0x49C7F4
