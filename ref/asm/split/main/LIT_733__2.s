.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_733__2
/* 19AB50 0029AA50 67656469 */ .word 0x69646567
/* 19AB54 0029AA54 742F6530 */ .word 0x30652F74
/* 19AB58 0029AA58 312F6663 */ .word 0x63662F31
/* 19AB5C 0029AA5C 6F6E762E */ .word 0x2E766E6F
/* 19AB60 0029AA60 62696E00 */ .word GlobalDataBuffer + 0x43B8E2
/* 19AB64 0029AA64 00000000 */ .word 0x00000000
/* 19AB68 0029AA68 00000000 */ .word 0x00000000
/* 19AB6C 0029AA6C 00000000 */ .word 0x00000000
