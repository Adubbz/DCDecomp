.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3309
/* 19C090 0029BF90 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C094 0029BF94 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C098 0029BF98 20657665 */ .word 0x65766520
/* 19C09C 0029BF9C 6E74204E */ .word 0x4E20746E
/* 19C0A0 0029BFA0 554C4C20 */ .word 0x204C4C55
/* 19C0A4 0029BFA4 21210A00 */ .word 0x000A2121
/* 19C0A8 0029BFA8 00000000 */ .word 0x00000000
/* 19C0AC 0029BFAC 00000000 */ .word 0x00000000
