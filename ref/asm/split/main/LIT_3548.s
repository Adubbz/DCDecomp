.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_3548
/* 19EE98 0029ED98 6576656E */ .word 0x6E657665
/* 19EE9C 0029ED9C 746D6E75 */ .word 0x756E6D74
/* 19EEA0 0029EDA0 2E696D67 */ .word 0x676D692E
/* 19EEA4 0029EDA4 00000000 */ .word 0x00000000
