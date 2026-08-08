.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_726
/* 199040 00298F40 53484144 */ .word 0x44414853
/* 199044 00298F44 4F575F56 */ .word 0x565F574F
/* 199048 00298F48 45525445 */ .word 0x45545245
/* 19904C 00298F4C 585F414E */ .word 0x4E415F58
/* 199050 00298F50 494D4500 */ .word GlobalDataBuffer + 0x1A9CC9
/* 199054 00298F54 00000000 */ .word 0x00000000
