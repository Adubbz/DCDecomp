.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3429
/* 19EE70 0029ED70 65786973 */ .word 0x73697865
/* 19EE74 0029ED74 74206166 */ .word 0x66612074
/* 19EE78 0029ED78 74657220 */ .word 0x20726574
/* 19EE7C 0029ED7C 75736520 */ .word 0x20657375
/* 19EE80 0029ED80 0A000000 */ .word 0x0000000A
/* 19EE84 0029ED84 00000000 */ .word 0x00000000
