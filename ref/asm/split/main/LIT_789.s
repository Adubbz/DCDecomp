.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_789
/* 199A50 00299950 4D494449 */ .word 0x4944494D
/* 199A54 00299954 20726573 */ .word 0x73657220
/* 199A58 00299958 74617274 */ .word 0x74726174
/* 199A5C 0029995C 2120706F */ .word 0x6F702021
/* 199A60 00299960 72743D25 */ .word 0x253D7472
/* 199A64 00299964 64200A00 */ .word 0x000A2064
/* 199A68 00299968 00000000 */ .word 0x00000000
/* 199A6C 0029996C 00000000 */ .word 0x00000000
