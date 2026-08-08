.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1531
/* 19B930 0029B830 464C4F4F */ .word 0x4F4F4C46
/* 19B934 0029B834 52204154 */ .word 0x54412052
/* 19B938 0029B838 52412047 */ .word 0x47204152
/* 19B93C 0029B83C 45542120 */ .word 0x20215445
/* 19B940 0029B840 2020200A */ .word 0x0A202020
/* 19B944 0029B844 00000000 */ .word 0x00000000
/* 19B948 0029B848 00000000 */ .word 0x00000000
/* 19B94C 0029B84C 00000000 */ .word 0x00000000
