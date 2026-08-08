.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_373
/* 1991D0 002990D0 66696C65 */ .word 0x656C6966
/* 1991D4 002990D4 20686561 */ .word 0x61656820
/* 1991D8 002990D8 64657220 */ .word 0x20726564
/* 1991DC 002990DC 73697A65 */ .word 0x657A6973
/* 1991E0 002990E0 203D2025 */ .word 0x25203D20
/* 1991E4 002990E4 640A0000 */ .word 0x00000A64
