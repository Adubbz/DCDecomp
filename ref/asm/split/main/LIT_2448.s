.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2448
/* 19BFC0 0029BEC0 6976656E */ .word 0x6E657669
/* 19BFC4 0029BEC4 74206275 */ .word 0x75622074
/* 19BFC8 0029BEC8 66666572 */ .word 0x72656666
/* 19BFCC 0029BECC 206F7665 */ .word 0x65766F20
/* 19BFD0 0029BED0 72202121 */ .word 0x21212072
/* 19BFD4 0029BED4 0A000000 */ .word 0x0000000A
