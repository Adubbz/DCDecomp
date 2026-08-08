.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1620
/* 19BAD0 0029B9D0 63706F73 */ .word 0x736F7063
/* 19BAD4 0029B9D4 20252E32 */ .word 0x322E2520
/* 19BAD8 0029B9D8 662F2025 */ .word 0x25202F66
/* 19BADC 0029B9DC 2E32662F */ .word 0x2F66322E
/* 19BAE0 0029B9E0 20252E32 */ .word 0x322E2520
/* 19BAE4 0029B9E4 660A0000 */ .word 0x00000A66
/* 19BAE8 0029B9E8 00000000 */ .word 0x00000000
/* 19BAEC 0029B9EC 00000000 */ .word 0x00000000
