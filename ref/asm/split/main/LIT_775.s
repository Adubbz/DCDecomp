.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_775
/* 199148 00299048 6E6F7420 */ .word 0x20746F6E
/* 19914C 0029904C 666F756E */ .word 0x6E756F66
/* 199150 00299050 64202573 */ .word 0x73252064
/* 199154 00299054 0A000000 */ .word 0x0000000A
