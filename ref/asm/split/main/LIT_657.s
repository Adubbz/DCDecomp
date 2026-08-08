.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_657
/* 199460 00299360 736F756E */ .word 0x6E756F73
/* 199464 00299364 642F7462 */ .word 0x62742F64
/* 199468 00299368 6C2F7365 */ .word 0x65732F6C
/* 19946C 0029936C 74626C2E */ .word 0x2E6C6274
/* 199470 00299370 74787400 */ .word GlobalDataBuffer + 0x49C7F4
/* 199474 00299374 00000000 */ .word 0x00000000
/* 199478 00299378 00000000 */ .word 0x00000000
/* 19947C 0029937C 00000000 */ .word 0x00000000
