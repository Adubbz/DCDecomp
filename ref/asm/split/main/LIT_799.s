.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_799
/* 19A118 0029A018 52455645 */ .word 0x45564552
/* 19A11C 0029A01C 52424500 */ .word GlobalDataBuffer + 0x1A91D2
