.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_760
/* 19D250 0029D150 6974656D */ .word 0x6D657469
/* 19D254 0029D154 73686F70 */ .word 0x706F6873
/* 19D258 0029D158 2E70616B */ .word 0x6B61702E
/* 19D25C 0029D15C 00000000 */ .word 0x00000000
