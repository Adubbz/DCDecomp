.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2613
/* 19B350 0029B250 2070726F */ .word 0x6F727020
/* 19B354 0029B254 6A656374 */ .word 0x7463656A
/* 19B358 0029B258 696F6E20 */ .word 0x206E6F69
/* 19B35C 0029B25C 3D202537 */ .word 0x3725203D
/* 19B360 0029B260 2E31660A */ .word 0x0A66312E
/* 19B364 0029B264 00000000 */ .word 0x00000000
