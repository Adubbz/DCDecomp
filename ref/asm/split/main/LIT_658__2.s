.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_658__2
/* 19C6F0 0029C5F0 64756E2F */ .word 0x2F6E7564
/* 19C6F4 0029C5F4 6D61696E */ .word 0x6E69616D
/* 19C6F8 0029C5F8 63686172 */ .word 0x72616863
/* 19C6FC 0029C5FC 612F6330 */ .word 0x30632F61
/* 19C700 0029C600 36625F65 */ .word 0x655F6236
/* 19C704 0029C604 7830302E */ .word 0x2E303078
/* 19C708 0029C608 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19C70C 0029C60C 00000000 */ .word 0x00000000
