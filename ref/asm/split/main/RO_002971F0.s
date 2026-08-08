.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002971F0
/* 1972F0 002971F0 4469736B */ .word 0x6B736944
/* 1972F4 002971F4 52656164 */ .word 0x64616552
/* 1972F8 002971F8 7920656E */ .word 0x6E652079
/* 1972FC 002971FC 6465640A */ .word 0x0A646564
/* 197300 00297200 00000000 */ .word 0x00000000
/* 197304 00297204 00000000 */ .word 0x00000000
