.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3082
/* 19EDD0 0029ECD0 646B6963 */ .word 0x63696B64
/* 19EDD4 0029ECD4 6F6E5F64 */ .word 0x645F6E6F
/* 19EDD8 0029ECD8 2E69636F */ .word 0x6F63692E
/* 19EDDC 0029ECDC 00000000 */ .word 0x00000000
