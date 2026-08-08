.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_444__2
/* 19AA30 0029A930 67656469 */ .word 0x69646567
/* 19AA34 0029A934 742F7379 */ .word 0x79732F74
/* 19AA38 0029A938 7374656D */ .word 0x6D657473
/* 19AA3C 0029A93C 2F657665 */ .word 0x6576652F
/* 19AA40 0029A940 6E742E73 */ .word 0x732E746E
/* 19AA44 0029A944 74620000 */ .word 0x00006274
