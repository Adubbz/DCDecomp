.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_421__2
/* 19B390 0029B290 25732F65 */ .word 0x652F7325
/* 19B394 0029B294 76656E74 */ .word 0x746E6576
/* 19B398 0029B298 2E737462 */ .word 0x6274732E
/* 19B39C 0029B29C 00000000 */ .word 0x00000000
