.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3606
/* 19C0D0 0029BFD0 202A2A2A */ .word 0x2A2A2A20
/* 19C0D4 0029BFD4 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C0D8 0029BFD8 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C0DC 0029BFDC 2A2A206F */ .word 0x6F202A2A
/* 19C0E0 0029BFE0 76657221 */ .word 0x21726576
/* 19C0E4 0029BFE4 210A0000 */ .word 0x00000A21
