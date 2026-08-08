.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2245
/* 19D940 0029D840 6B616765 */ .word 0x6567616B
/* 19D944 0029D844 7379616F */ .word 0x6F617973
/* 19D948 0029D848 00000000 */ .word 0x00000000
/* 19D94C 0029D84C 00000000 */ .word 0x00000000
