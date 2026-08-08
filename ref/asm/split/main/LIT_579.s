.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_579
/* 19BD90 0029BC90 2A2A206F */ .word 0x6F202A2A
/* 19BD94 0029BC94 626A2068 */ .word 0x68206A62
/* 19BD98 0029BC98 646C2065 */ .word 0x65206C64
/* 19BD9C 0029BC9C 7272202A */ .word 0x2A207272
/* 19BDA0 0029BCA0 2A0A0000 */ .word 0x00000A2A
/* 19BDA4 0029BCA4 00000000 */ .word 0x00000000
/* 19BDA8 0029BCA8 00000000 */ .word 0x00000000
/* 19BDAC 0029BCAC 00000000 */ .word 0x00000000
