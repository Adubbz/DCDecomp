.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_517__2
/* 19C268 0029C168 5552415F */ .word 0x5F415255
/* 19C26C 0029C16C 4C494748 */ .word 0x4847494C
/* 19C270 0029C170 545F4300 */ .word GlobalDataBuffer + 0x18AED4
/* 19C274 0029C174 00000000 */ .word 0x00000000
