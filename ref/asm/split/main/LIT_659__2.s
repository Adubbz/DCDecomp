.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_659__2
/* 19C710 0029C610 64756E2F */ .word 0x2F6E7564
/* 19C714 0029C614 6D61696E */ .word 0x6E69616D
/* 19C718 0029C618 63686172 */ .word 0x72616863
/* 19C71C 0029C61C 612F6330 */ .word 0x30632F61
/* 19C720 0029C620 35615F65 */ .word 0x655F6135
/* 19C724 0029C624 7830302E */ .word 0x2E303078
/* 19C728 0029C628 63687200 */ .word GlobalDataBuffer + 0x47B7E3
/* 19C72C 0029C62C 00000000 */ .word 0x00000000
