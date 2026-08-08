.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_793
/* 19C7B0 0029C6B0 64756E2F */ .word 0x2F6E7564
/* 19C7B4 0029C6B4 6974656D */ .word 0x6D657469
/* 19C7B8 0029C6B8 2F6D6169 */ .word 0x69616D2F
/* 19C7BC 0029C6BC 6E5F6461 */ .word 0x61645F6E
/* 19C7C0 0029C6C0 74612F00 */ .word GlobalDataBuffer + 0x4B0F4
/* 19C7C4 0029C6C4 00000000 */ .word 0x00000000
