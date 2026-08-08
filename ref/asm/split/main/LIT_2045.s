.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2045
/* 19F180 0029F080 74797065 */ .word 0x65707974
/* 19F184 0029F084 3A202020 */ .word 0x2020203A
/* 19F188 0029F088 203A2573 */ .word 0x73253A20
/* 19F18C 0029F08C 0A000000 */ .word 0x0000000A
