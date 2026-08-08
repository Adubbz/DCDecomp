.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_660
/* 19C730 0029C630 64756E2F */ .word 0x2F6E7564
/* 19C734 0029C634 6D61696E */ .word 0x6E69616D
/* 19C738 0029C638 63686172 */ .word 0x72616863
/* 19C73C 0029C63C 612F6331 */ .word 0x31632F61
/* 19C740 0029C640 30625F65 */ .word 0x655F6230
/* 19C744 0029C644 7830302E */ .word 0x2E303078
/* 19C748 0029C648 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19C74C 0029C64C 00000000 */ .word 0x00000000
