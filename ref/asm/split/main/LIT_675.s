.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_675
/* 19CC80 0029CB80 696D6F64 */ .word 0x646F6D69
/* 19CC84 0029CB84 616E676F */ .word 0x6F676E61
/* 19CC88 0029CB88 00000000 */ .word 0x00000000
/* 19CC8C 0029CB8C 00000000 */ .word 0x00000000
