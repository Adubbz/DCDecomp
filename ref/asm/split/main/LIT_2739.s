.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2739
/* 19ADF0 0029ACF0 23666F6E */ .word 0x6E6F6623
/* 19ADF4 0029ACF4 74626173 */ .word 0x73616274
/* 19ADF8 0029ACF8 65233531 */ .word 0x31352365
/* 19ADFC 0029ACFC 32233235 */ .word 0x35322332
/* 19AE00 0029AD00 36233100 */ .word GlobalDataBuffer + 0x672B6
/* 19AE04 0029AD04 00000000 */ .word 0x00000000
/* 19AE08 0029AD08 00000000 */ .word 0x00000000
/* 19AE0C 0029AD0C 00000000 */ .word 0x00000000
