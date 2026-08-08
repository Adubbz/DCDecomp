.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_355__4
/* 19FE90 0029FD90 23667261 */ .word 0x61726623
/* 19FE94 0029FD94 6D655F69 */ .word 0x695F656D
/* 19FE98 0029FD98 6D616765 */ .word 0x6567616D
/* 19FE9C 0029FD9C 5F6D6573 */ .word 0x73656D5F
/* 19FEA0 0029FDA0 23363430 */ .word 0x30343623
/* 19FEA4 0029FDA4 23343438 */ .word 0x38343423
/* 19FEA8 0029FDA8 23340000 */ .word 0x00003423
/* 19FEAC 0029FDAC 00000000 */ .word 0x00000000
