.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_414__4
/* 199B40 00299A40 23232323 */ .word 0x23232323
/* 199B44 00299A44 2323204D */ .word 0x4D202323
/* 199B48 00299A48 41585F56 */ .word 0x565F5841
/* 199B4C 00299A4C 45525458 */ .word 0x58545245
/* 199B50 00299A50 204F5645 */ .word 0x45564F20
/* 199B54 00299A54 52202564 */ .word 0x64252052
/* 199B58 00299A58 2F256423 */ .word 0x2364252F
/* 199B5C 00299A5C 23232323 */ .word 0x23232323
/* 199B60 00299A60 230A0000 */ .word 0x00000A23
/* 199B64 00299A64 00000000 */ .word 0x00000000
