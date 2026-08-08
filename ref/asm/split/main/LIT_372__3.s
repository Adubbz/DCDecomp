.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_372__3
/* 19E5D0 0029E4D0 42495343 */ .word 0x43534942
/* 19E5D4 0029E4D4 50532D31 */ .word 0x312D5350
/* 19E5D8 0029E4D8 35303034 */ .word 0x34303035
/* 19E5DC 0029E4DC 646B636C */ .word 0x6C636B64
/* 19E5E0 0029E4E0 6F756400 */ .word GlobalDataBuffer + 0x39C4EF
/* 19E5E4 0029E4E4 00000000 */ .word 0x00000000
/* 19E5E8 0029E4E8 00000000 */ .word 0x00000000
/* 19E5EC 0029E4EC 00000000 */ .word 0x00000000
