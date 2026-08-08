.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1082
/* 199730 00299630 23666F6E */ .word 0x6E6F6623
/* 199734 00299634 74626173 */ .word 0x73616274
/* 199738 00299638 65233531 */ .word 0x31352365
/* 19973C 0029963C 32233235 */ .word 0x35322332
/* 199740 00299640 36233100 */ .word GlobalDataBuffer + 0x672B6
/* 199744 00299644 00000000 */ .word 0x00000000
/* 199748 00299648 00000000 */ .word 0x00000000
/* 19974C 0029964C 00000000 */ .word 0x00000000
