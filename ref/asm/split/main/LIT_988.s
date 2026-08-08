.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_988
/* 19DF78 0029DE78 6B616765 */ .word 0x6567616B
/* 19DF7C 0029DE7C 72756279 */ .word 0x79627572
/* 19DF80 0029DE80 00000000 */ .word 0x00000000
/* 19DF84 0029DE84 00000000 */ .word 0x00000000
