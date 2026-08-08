.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_357__3
/* 19FED0 0029FDD0 23666F6E */ .word 0x6E6F6623
/* 19FED4 0029FDD4 74626173 */ .word 0x73616274
/* 19FED8 0029FDD8 65233531 */ .word 0x31352365
/* 19FEDC 0029FDDC 32233235 */ .word 0x35322332
/* 19FEE0 0029FDE0 36233100 */ .word GlobalDataBuffer + 0x672B6
/* 19FEE4 0029FDE4 00000000 */ .word 0x00000000
/* 19FEE8 0029FDE8 00000000 */ .word 0x00000000
/* 19FEEC 0029FDEC 00000000 */ .word 0x00000000
