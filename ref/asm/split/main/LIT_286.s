.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_286
/* 199CB0 00299BB0 25732F6D */ .word 0x6D2F7325
/* 199CB4 00299BB4 74302564 */ .word 0x64253074
/* 199CB8 00299BB8 2E746D32 */ .word 0x326D742E
/* 199CBC 00299BBC 00000000 */ .word 0x00000000
