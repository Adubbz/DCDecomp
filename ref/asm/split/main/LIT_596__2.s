.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_596__2
/* 19A920 0029A820 25736B2E */ .word 0x2E6B7325
/* 19A924 0029A824 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
/* 19A928 0029A828 00000000 */ .word 0x00000000
/* 19A92C 0029A82C 00000000 */ .word 0x00000000
