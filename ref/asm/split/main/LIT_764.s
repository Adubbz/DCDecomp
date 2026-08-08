.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_764
/* 19C350 0029C250 54414720 */ .word 0x20474154
/* 19C354 0029C254 53796E74 */ .word 0x746E7953
/* 19C358 0029C258 61784572 */ .word 0x72457861
/* 19C35C 0029C25C 726F7221 */ .word 0x21726F72
/* 19C360 0029C260 21203E3E */ .word 0x3E3E2021
/* 19C364 0029C264 25730A00 */ .word 0x000A7325
/* 19C368 0029C268 00000000 */ .word 0x00000000
/* 19C36C 0029C26C 00000000 */ .word 0x00000000
