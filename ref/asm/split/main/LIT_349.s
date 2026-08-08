.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_349
/* 19A060 00299F60 736F756E */ .word 0x6E756F73
/* 19A064 00299F64 642F6267 */ .word 0x67622F64
/* 19A068 00299F68 6D2F2573 */ .word 0x73252F6D
/* 19A06C 00299F6C 2E736E64 */ .word 0x646E732E
/* 19A070 00299F70 00000000 */ .word 0x00000000
/* 19A074 00299F74 00000000 */ .word 0x00000000
