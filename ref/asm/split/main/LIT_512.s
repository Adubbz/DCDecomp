.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_512
/* 19BC08 0029BB08 64756E2F */ .word 0x2F6E7564
/* 19BC0C 0029BB0C 696D672F */ .word 0x2F676D69
/* 19BC10 0029BB10 75732F00 */ .word GlobalDataBuffer + 0x4C2F5
/* 19BC14 0029BB14 00000000 */ .word 0x00000000
