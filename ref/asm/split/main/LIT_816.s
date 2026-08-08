.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_816
/* 19E810 0029E710 6F70656E */ .word 0x6E65706F
/* 19E814 0029E714 20657272 */ .word 0x72726520
/* 19E818 0029E718 6F72203D */ .word 0x3D20726F
/* 19E81C 0029E71C 2025640A */ .word 0x0A642520
/* 19E820 0029E720 00000000 */ .word 0x00000000
/* 19E824 0029E724 00000000 */ .word 0x00000000
/* 19E828 0029E728 00000000 */ .word 0x00000000
/* 19E82C 0029E72C 00000000 */ .word 0x00000000
