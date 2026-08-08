.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_787
/* 19D290 0029D190 6974656D */ .word 0x6D657469
/* 19D294 0029D194 73686F70 */ .word 0x706F6873
/* 19D298 0029D198 2E696D67 */ .word 0x676D692E
/* 19D29C 0029D19C 00000000 */ .word 0x00000000
