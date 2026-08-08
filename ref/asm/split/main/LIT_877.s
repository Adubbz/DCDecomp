.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_877
/* 19A990 0029A890 53545544 */ .word 0x44555453
/* 19A994 0029A894 494F5F41 */ .word 0x415F4F49
/* 19A998 0029A898 00000000 */ .word 0x00000000
/* 19A99C 0029A89C 00000000 */ .word 0x00000000
