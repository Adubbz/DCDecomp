.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_894
/* 199618 00299518 25734C61 */ .word 0x614C7325
/* 19961C 0029951C 6E677561 */ .word 0x6175676E
/* 199620 00299520 67652025 */ .word 0x25206567
/* 199624 00299524 640A0000 */ .word 0x00000A64
