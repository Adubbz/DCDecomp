.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3600
/* 19C0B0 0029BFB0 2A2A2065 */ .word 0x65202A2A
/* 19C0B4 0029BFB4 76656E74 */ .word 0x746E6576
/* 19C0B8 0029BFB8 64617461 */ .word 0x61746164
/* 19C0BC 0029BFBC 20657272 */ .word 0x72726520
/* 19C0C0 0029BFC0 200A0000 */ .word 0x00000A20
/* 19C0C4 0029BFC4 00000000 */ .word 0x00000000
/* 19C0C8 0029BFC8 00000000 */ .word 0x00000000
/* 19C0CC 0029BFCC 00000000 */ .word 0x00000000
