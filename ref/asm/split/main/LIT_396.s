.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_396
/* 19A1F8 0029A0F8 66785F66 */ .word 0x665F7866
/* 19A1FC 0029A0FC 6F6F7432 */ .word 0x32746F6F
/* 19A200 0029A100 00000000 */ .word 0x00000000
/* 19A204 0029A104 00000000 */ .word 0x00000000
