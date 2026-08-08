.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_416
/* 198F60 00298E60 62617365 */ .word 0x65736162
/* 198F64 00298E64 203D2025 */ .word 0x25203D20
/* 198F68 00298E68 782C6375 */ .word 0x75632C78
/* 198F6C 00298E6C 7572203D */ .word 0x3D207275
/* 198F70 00298E70 2025780A */ .word 0x0A782520
/* 198F74 00298E74 00000000 */ .word 0x00000000
