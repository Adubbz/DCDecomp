.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_819
/* 19D2F0 0029D1F0 23667261 */ .word 0x61726623
/* 19D2F4 0029D1F4 6D655F6D */ .word 0x6D5F656D
/* 19D2F8 0029D1F8 656E7573 */ .word 0x73756E65
/* 19D2FC 0029D1FC 686F705F */ .word 0x5F706F68
/* 19D300 0029D200 6D6F6465 */ .word 0x65646F6D
/* 19D304 0029D204 6C233634 */ .word 0x3436236C
/* 19D308 0029D208 30233434 */ .word 0x34342330
/* 19D30C 0029D20C 38233400 */ .word GlobalDataBuffer + 0x972B8
