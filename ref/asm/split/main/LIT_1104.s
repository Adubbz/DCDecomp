.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1104
/* 19E050 0029DF50 77656170 */ .word 0x70616577
/* 19E054 0029DF54 6F6E206D */ .word 0x6D206E6F
/* 19E058 0029DF58 6F64656C */ .word 0x6C65646F
/* 19E05C 0029DF5C 20627569 */ .word 0x69756220
/* 19E060 0029DF60 6C642066 */ .word 0x6620646C
/* 19E064 0029DF64 756E6320 */ .word 0x20636E75
/* 19E068 0029DF68 73746172 */ .word 0x72617473
/* 19E06C 0029DF6C 740A0000 */ .word 0x00000A74
