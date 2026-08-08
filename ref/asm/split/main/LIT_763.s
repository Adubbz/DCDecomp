.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_763
/* 19C330 0029C230 61726720 */ .word 0x20677261
/* 19C334 0029C234 6C696E65 */ .word 0x656E696C
/* 19C338 0029C238 206C6576 */ .word 0x76656C20
/* 19C33C 0029C23C 656C2065 */ .word 0x65206C65
/* 19C340 0029C240 72722121 */ .word 0x21217272
/* 19C344 0029C244 0A000000 */ .word 0x0000000A
/* 19C348 0029C248 00000000 */ .word 0x00000000
/* 19C34C 0029C24C 00000000 */ .word 0x00000000
