.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1263
/* 19B530 0029B430 686F7374 */ .word 0x74736F68
/* 19B534 0029B434 303A793A */ .word 0x3A793A30
/* 19B538 0029B438 2F707332 */ .word 0x3273702F
/* 19B53C 0029B43C 2F64635F */ .word 0x5F63642F
/* 19B540 0029B440 64617461 */ .word 0x61746164
/* 19B544 0029B444 2F676461 */ .word 0x6164672F
/* 19B548 0029B448 7461302E */ .word 0x2E306174
/* 19B54C 0029B44C 65647400 */ .word GlobalDataBuffer + 0x49B3E5
