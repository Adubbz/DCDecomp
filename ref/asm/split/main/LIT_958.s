.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_958
/* 19BD70 0029BC70 47455420 */ .word 0x20544547
/* 19BD74 0029BC74 41545241 */ .word 0x41525441
/* 19BD78 0029BC78 205B2564 */ .word 0x64255B20
/* 19BD7C 0029BC7C 5D202121 */ .word 0x2121205D
/* 19BD80 0029BC80 0A000000 */ .word 0x0000000A
/* 19BD84 0029BC84 00000000 */ .word 0x00000000
