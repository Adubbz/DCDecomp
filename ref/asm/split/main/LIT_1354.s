.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1354
/* 19B690 0029B590 64756E2F */ .word 0x2F6E7564
/* 19B694 0029B594 6D657373 */ .word 0x7373656D
/* 19B698 0029B598 6167652F */ .word 0x2F656761
/* 19B69C 0029B59C 77775F6D */ .word 0x6D5F7777
/* 19B6A0 0029B5A0 65732F73 */ .word 0x732F7365
/* 19B6A4 0029B5A4 74657665 */ .word 0x65766574
/* 19B6A8 0029B5A8 3025645F */ .word 0x5F642530
/* 19B6AC 0029B5AC 25642E6D */ .word 0x6D2E6425
/* 19B6B0 0029B5B0 65730000 */ .word 0x00007365
/* 19B6B4 0029B5B4 00000000 */ .word 0x00000000
