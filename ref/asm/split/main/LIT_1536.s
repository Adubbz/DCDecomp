.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1536
/* 19E2D8 0029E1D8 77657073 */ .word 0x73706577
/* 19E2DC 0029E1DC 74617475 */ .word 0x75746174
/* 19E2E0 0029E1E0 73000000 */ .word 0x00000073
/* 19E2E4 0029E1E4 00000000 */ .word 0x00000000
/* 19E2E8 0029E1E8 00000000 */ .word 0x00000000
/* 19E2EC 0029E1EC 00000000 */ .word 0x00000000
