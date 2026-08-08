.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297EC0
/* 197FC0 00297EC0 5454593A */ .word 0x3A595454
/* 197FC4 00297EC4 20726563 */ .word 0x63657220
/* 197FC8 00297EC8 65697665 */ .word 0x65766965
/* 197FCC 00297ECC 20657272 */ .word 0x72726520
/* 197FD0 00297ED0 6F720000 */ .word 0x0000726F
/* 197FD4 00297ED4 00000000 */ .word 0x00000000
