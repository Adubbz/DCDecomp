.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_656__4
/* 19C6B0 0029C5B0 64756E2F */ .word 0x2F6E7564
/* 19C6B4 0029C5B4 6D61696E */ .word 0x6E69616D
/* 19C6B8 0029C5B8 63686172 */ .word 0x72616863
/* 19C6BC 0029C5BC 612F6330 */ .word 0x30632F61
/* 19C6C0 0029C5C0 31645F65 */ .word 0x655F6431
/* 19C6C4 0029C5C4 7830302E */ .word 0x2E303078
/* 19C6C8 0029C5C8 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19C6CC 0029C5CC 00000000 */ .word 0x00000000
