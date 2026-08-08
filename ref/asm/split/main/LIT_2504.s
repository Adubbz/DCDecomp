.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2504
/* 19EC40 0029EB40 53617665 */ .word 0x65766153
/* 19EC44 0029EB44 44617461 */ .word 0x61746144
/* 19EC48 0029EB48 20636C65 */ .word 0x656C6320
/* 19EC4C 0029EB4C 61722066 */ .word 0x66207261
/* 19EC50 0029EB50 6C616720 */ .word 0x2067616C
/* 19EC54 0029EB54 3D202564 */ .word 0x6425203D
/* 19EC58 0029EB58 0A000000 */ .word 0x0000000A
/* 19EC5C 0029EB5C 00000000 */ .word 0x00000000
