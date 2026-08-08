.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_515
/* 19A0C0 00299FC0 736F756E */ .word 0x6E756F73
/* 19A0C4 00299FC4 642F7365 */ .word 0x65732F64
/* 19A0C8 00299FC8 742F2573 */ .word 0x73252F74
/* 19A0CC 00299FCC 2E736E64 */ .word 0x646E732E
/* 19A0D0 00299FD0 00000000 */ .word 0x00000000
/* 19A0D4 00299FD4 00000000 */ .word 0x00000000
