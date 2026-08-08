.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1550
/* 19B9F8 0029B8F8 42494E32 */ .word 0x324E4942
/* 19B9FC 0029B8FC 00000000 */ .word 0x00000000
