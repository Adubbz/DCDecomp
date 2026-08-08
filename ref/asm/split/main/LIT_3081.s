.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3081
/* 19EDC0 0029ECC0 646B6963 */ .word 0x63696B64
/* 19EDC4 0029ECC4 6F6E5F63 */ .word 0x635F6E6F
/* 19EDC8 0029ECC8 2E69636F */ .word 0x6F63692E
/* 19EDCC 0029ECCC 00000000 */ .word 0x00000000
