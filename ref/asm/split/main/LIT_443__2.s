.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_443__2
/* 19AA20 0029A920 6576656E */ .word 0x6E657665
/* 19AA24 0029A924 742E7374 */ .word 0x74732E74
/* 19AA28 0029A928 62000000 */ .word 0x00000062
/* 19AA2C 0029A92C 00000000 */ .word 0x00000000
