.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_541
/* 198EB0 00298DB0 73686164 */ .word 0x64616873
/* 198EB4 00298DB4 6F772069 */ .word 0x6920776F
/* 198EB8 00298DB8 6E697469 */ .word 0x6974696E
/* 198EBC 00298DBC 616C697A */ .word 0x7A696C61
/* 198EC0 00298DC0 65206661 */ .word 0x61662065
/* 198EC4 00298DC4 696C6564 */ .word 0x64656C69
/* 198EC8 00298DC8 0A000000 */ .word 0x0000000A
/* 198ECC 00298DCC 00000000 */ .word 0x00000000
