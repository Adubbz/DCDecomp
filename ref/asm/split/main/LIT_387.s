.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_387
/* 1991E8 002990E8 5C444154 */ .word 0x5441445C
/* 1991EC 002990EC 412E4441 */ .word 0x41442E41
/* 1991F0 002990F0 543B3100 */ .word GlobalDataBuffer + 0x68AD4
/* 1991F4 002990F4 00000000 */ .word 0x00000000
/* 1991F8 002990F8 00000000 */ .word 0x00000000
/* 1991FC 002990FC 00000000 */ .word 0x00000000
