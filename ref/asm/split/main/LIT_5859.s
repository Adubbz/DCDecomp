.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_5859
/* 19DC78 0029DB78 636C6561 */ .word 0x61656C63
/* 19DC7C 0029DB7C 72212121 */ .word 0x21212172
/* 19DC80 0029DB80 210A0000 */ .word 0x00000A21
/* 19DC84 0029DB84 00000000 */ .word 0x00000000
/* 19DC88 0029DB88 00000000 */ .word 0x00000000
/* 19DC8C 0029DB8C 00000000 */ .word 0x00000000
