.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_373__4
/* 19E5F0 0029E4F0 42415343 */ .word 0x43534142
/* 19E5F4 0029E4F4 55532D39 */ .word 0x392D5355
/* 19E5F8 0029E4F8 37313131 */ .word 0x31313137
/* 19E5FC 0029E4FC 646B636C */ .word 0x6C636B64
/* 19E600 0029E500 6F756400 */ .word GlobalDataBuffer + 0x39C4EF
/* 19E604 0029E504 00000000 */ .word 0x00000000
