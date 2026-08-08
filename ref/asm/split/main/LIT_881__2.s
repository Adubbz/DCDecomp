.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_881__2
/* 19A9C8 0029A8C8 53504143 */ .word 0x43415053
/* 19A9CC 0029A8CC 45000000 */ .word 0x00000045
