.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2503
/* 19EC28 0029EB28 73617665 */ .word 0x65766173
/* 19EC2C 0029EB2C 7465782E */ .word 0x2E786574
/* 19EC30 0029EB30 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
/* 19EC34 0029EB34 00000000 */ .word 0x00000000
/* 19EC38 0029EB38 00000000 */ .word 0x00000000
/* 19EC3C 0029EB3C 00000000 */ .word 0x00000000
