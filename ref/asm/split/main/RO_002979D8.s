.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002979D8
/* 197AD8 002979D8 093C4431 */ .word 0x31443C09
/* 197ADC 002979DC 5F434843 */ .word 0x4348435F
/* 197AE0 002979E0 523D2530 */ .word 0x30253D52
/* 197AE4 002979E4 38783A00 */ .word GlobalDataBuffer + 0xFC7B8
