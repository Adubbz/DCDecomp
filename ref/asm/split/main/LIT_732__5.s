.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_732__5
/* 19CF50 0029CE50 66756E64 */ .word 0x646E7566
/* 19CF54 0029CE54 74696F6E */ .word 0x6E6F6974
/* 19CF58 0029CE58 00000000 */ .word 0x00000000
/* 19CF5C 0029CE5C 00000000 */ .word 0x00000000
