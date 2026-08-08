.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_448
/* 19A280 0029A180 5445585F */ .word 0x5F584554
/* 19A284 0029A184 414E494D */ .word 0x4D494E41
/* 19A288 0029A188 455F4441 */ .word 0x41445F45
/* 19A28C 0029A18C 54410000 */ .word 0x00004154
