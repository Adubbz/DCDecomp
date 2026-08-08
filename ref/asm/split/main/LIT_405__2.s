.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_405__2
/* 19E6E0 0029E5E0 82638281 */ .word 0x81826382
/* 19E6E4 0029E5E4 8292828B */ .word 0x8B829282
/* 19E6E8 0029E5E8 81408262 */ .word 0x62824081
/* 19E6EC 0029E5EC 828C828F */ .word 0x8F828C82
/* 19E6F0 0029E5F0 82958284 */ .word 0x84829582
/* 19E6F4 0029E5F4 81408263 */ .word 0x63824081
/* 19E6F8 0029E5F8 82818294 */ .word 0x94828182
/* 19E6FC 0029E5FC 82810000 */ .word 0x00008182
