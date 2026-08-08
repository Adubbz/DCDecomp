.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1105
/* 19E070 0029DF70 6D6F6465 */ .word 0x65646F6D
/* 19E074 0029DF74 6C627569 */ .word 0x6975626C
/* 19E078 0029DF78 6C646275 */ .word 0x7562646C
/* 19E07C 0029DF7C 66666572 */ .word 0x72656666
/* 19E080 0029DF80 203D2025 */ .word 0x25203D20
/* 19E084 0029DF84 700A0000 */ .word 0x00000A70
/* 19E088 0029DF88 00000000 */ .word 0x00000000
/* 19E08C 0029DF8C 00000000 */ .word 0x00000000
