.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_365
/* 19A838 0029A738 52455645 */ .word 0x45564552
/* 19A83C 0029A73C 52424500 */ .word GlobalDataBuffer + 0x1A91D2
