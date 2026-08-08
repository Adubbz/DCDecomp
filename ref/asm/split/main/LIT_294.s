.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_294
/* 199EC0 00299DC0 79616E65 */ .word 0x656E6179
/* 199EC4 00299DC4 32202D79 */ .word 0x792D2032
/* 199EC8 00299DC8 616E6531 */ .word 0x31656E61
/* 199ECC 00299DCC 00000000 */ .word 0x00000000
