.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_386__2
/* 19E6A0 0029E5A0 6D637365 */ .word 0x6573636D
/* 19E6A4 0029E5A4 72762E69 */ .word 0x692E7672
/* 19E6A8 0029E5A8 72782069 */ .word 0x69207872
/* 19E6AC 0029E5AC 73206F6C */ .word 0x6C6F2073
/* 19E6B0 0029E5B0 64206669 */ .word 0x69662064
/* 19E6B4 0029E5B4 6C650A00 */ .word 0x000A656C
/* 19E6B8 0029E5B8 00000000 */ .word 0x00000000
/* 19E6BC 0029E5BC 00000000 */ .word 0x00000000
