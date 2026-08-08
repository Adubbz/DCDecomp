.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297A18
/* 197B18 00297A18 093C4432 */ .word 0x32443C09
/* 197B1C 00297A1C 5F434843 */ .word 0x4348435F
/* 197B20 00297A20 523D2530 */ .word 0x30253D52
/* 197B24 00297A24 38783A00 */ .word GlobalDataBuffer + 0xFC7B8
