.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1364
/* 19B740 0029B640 69626F78 */ .word 0x786F6269
/* 19B744 0029B644 735F742E */ .word 0x2E745F73
/* 19B748 0029B648 6D647300 */ .word GlobalDataBuffer + 0x48B3ED
/* 19B74C 0029B64C 00000000 */ .word 0x00000000
