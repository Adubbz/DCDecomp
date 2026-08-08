.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_737
/* 1990D8 00298FD8 414C4C4F */ .word 0x4F4C4C41
/* 1990DC 00298FDC 435F4442 */ .word 0x42445F43
/* 1990E0 00298FE0 55464600 */ .word GlobalDataBuffer + 0x1B95D5
/* 1990E4 00298FE4 00000000 */ .word 0x00000000
/* 1990E8 00298FE8 00000000 */ .word 0x00000000
/* 1990EC 00298FEC 00000000 */ .word 0x00000000
