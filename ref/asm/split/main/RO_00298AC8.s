.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298AC8
/* 198BC8 00298AC8 62696E64 */ .word 0x646E6962
/* 198BCC 00298ACC 20657272 */ .word 0x72726520
/* 198BD0 00298AD0 6F72206C */ .word 0x6C20726F
/* 198BD4 00298AD4 69626D63 */ .word 0x636D6269
/* 198BD8 00298AD8 200A0000 */ .word 0x00000A20
/* 198BDC 00298ADC 00000000 */ .word 0x00000000
