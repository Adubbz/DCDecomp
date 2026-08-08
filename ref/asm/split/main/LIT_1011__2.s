.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1011__2
/* 19D6F0 0029D5F0 64756E67 */ .word 0x676E7564
/* 19D6F4 0029D5F4 656F6E2F */ .word 0x2F6E6F65
/* 19D6F8 0029D5F8 64756E6D */ .word 0x6D6E7564
/* 19D6FC 0029D5FC 656E7535 */ .word 0x35756E65
/* 19D700 0029D600 2E70616B */ .word 0x6B61702E
/* 19D704 0029D604 00000000 */ .word 0x00000000
