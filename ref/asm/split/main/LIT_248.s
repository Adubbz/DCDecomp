.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_248
/* 199870 00299770 657A5472 */ .word 0x72547A65
/* 199874 00299774 616E7354 */ .word 0x54736E61
/* 199878 00299778 6F494F50 */ .word 0x504F496F
/* 19987C 0029977C 20457272 */ .word 0x72724520
/* 199880 00299780 0A000000 */ .word 0x0000000A
/* 199884 00299784 00000000 */ .word 0x00000000
/* 199888 00299788 00000000 */ .word 0x00000000
/* 19988C 0029978C 00000000 */ .word 0x00000000
