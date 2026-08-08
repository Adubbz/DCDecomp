.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_661
/* 19C750 0029C650 64756E2F */ .word 0x2F6E7564
/* 19C754 0029C654 6D61696E */ .word 0x6E69616D
/* 19C758 0029C658 63686172 */ .word 0x72616863
/* 19C75C 0029C65C 612F6331 */ .word 0x31632F61
/* 19C760 0029C660 38615F65 */ .word 0x655F6138
/* 19C764 0029C664 7830302E */ .word 0x2E303078
/* 19C768 0029C668 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19C76C 0029C66C 00000000 */ .word 0x00000000
