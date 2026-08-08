.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_752
/* 19A100 0029A000 736F756E */ .word 0x6E756F73
/* 19A104 0029A004 642F7370 */ .word 0x70732F64
/* 19A108 0029A008 65636961 */ .word 0x61696365
/* 19A10C 0029A00C 6C2F2573 */ .word 0x73252F6C
/* 19A110 0029A010 2E736E64 */ .word 0x646E732E
/* 19A114 0029A014 00000000 */ .word 0x00000000
