.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1243
/* 19E250 0029E150 2A2A2A20 */ .word 0x202A2A2A
/* 19E254 0029E154 766F6963 */ .word 0x63696F76
/* 19E258 0029E158 65207265 */ .word 0x65722065
/* 19E25C 0029E15C 61642065 */ .word 0x65206461
/* 19E260 0029E160 7272200A */ .word 0x0A207272
/* 19E264 0029E164 00000000 */ .word 0x00000000
