.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2912
/* 19D4E0 0029D3E0 6E6F7720 */ .word 0x20776F6E
/* 19D4E4 0029D3E4 6D617264 */ .word 0x6472616D
/* 19D4E8 0029D3E8 616E206E */ .word 0x6E206E61
/* 19D4EC 0029D3EC 756D2849 */ .word 0x49286D75
/* 19D4F0 0029D3F0 6E74466C */ .word 0x6C46746E
/* 19D4F4 0029D3F4 6167293A */ .word 0x3A296761
/* 19D4F8 0029D3F8 0925640A */ .word 0x0A642509
/* 19D4FC 0029D3FC 00000000 */ .word 0x00000000
