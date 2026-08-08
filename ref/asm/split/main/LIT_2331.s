.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2331
/* 19D110 0029D010 2A2A2A2A */ .word 0x2A2A2A2A
/* 19D114 0029D014 2A2A2A20 */ .word 0x202A2A2A
/* 19D118 0029D018 53686F74 */ .word 0x746F6853
/* 19D11C 0029D01C 456E7472 */ .word 0x72746E45
/* 19D120 0029D020 79204572 */ .word 0x72452079
/* 19D124 0029D024 726F7220 */ .word 0x20726F72
/* 19D128 0029D028 21212A2A */ .word 0x2A2A2121
/* 19D12C 0029D02C 2A2A2A2A */ .word 0x2A2A2A2A
/* 19D130 0029D030 2A2A2A2A */ .word 0x2A2A2A2A
/* 19D134 0029D034 2A0A0000 */ .word 0x00000A2A
