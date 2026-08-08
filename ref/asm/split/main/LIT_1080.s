.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1080
/* 1996F0 002995F0 236D6573 */ .word 0x73656D23
/* 1996F4 002995F4 5F667261 */ .word 0x6172665F
/* 1996F8 002995F8 6D655F62 */ .word 0x625F656D
/* 1996FC 002995FC 75666623 */ .word 0x23666675
/* 199700 00299600 36343023 */ .word 0x23303436
/* 199704 00299604 34343823 */ .word 0x23383434
/* 199708 00299608 34000000 */ .word 0x00000034
/* 19970C 0029960C 00000000 */ .word 0x00000000
