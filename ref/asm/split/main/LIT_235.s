.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_235
/* 199190 00299090 2F2A2F2A */ .word 0x2A2F2A2F
/* 199194 00299094 2F2A2F2A */ .word 0x2A2F2A2F
/* 199198 00299098 2F6E6F74 */ .word 0x746F6E2F
/* 19919C 0029909C 20363462 */ .word 0x62343620
/* 1991A0 002990A0 79746520 */ .word 0x20657479
/* 1991A4 002990A4 616C6967 */ .word 0x67696C61
/* 1991A8 002990A8 6E206174 */ .word 0x7461206E
/* 1991AC 002990AC 20257820 */ .word 0x20782520
/* 1991B0 002990B0 25730A00 */ .word 0x000A7325
/* 1991B4 002990B4 00000000 */ .word 0x00000000
