.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_657__2
/* 19C6D0 0029C5D0 64756E2F */ .word 0x2F6E7564
/* 19C6D4 0029C5D4 6D61696E */ .word 0x6E69616D
/* 19C6D8 0029C5D8 63686172 */ .word 0x72616863
/* 19C6DC 0029C5DC 612F6330 */ .word 0x30632F61
/* 19C6E0 0029C5E0 34625F65 */ .word 0x655F6234
/* 19C6E4 0029C5E4 7830302E */ .word 0x2E303078
/* 19C6E8 0029C5E8 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19C6EC 0029C5EC 00000000 */ .word 0x00000000
