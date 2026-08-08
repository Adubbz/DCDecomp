.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_793__2
/* 19D2D8 0029D1D8 73686F70 */ .word 0x706F6873
/* 19D2DC 0029D1DC 6D616E2E */ .word 0x2E6E616D
/* 19D2E0 0029D1E0 62696E00 */ .word GlobalDataBuffer + 0x43B8E2
/* 19D2E4 0029D1E4 00000000 */ .word 0x00000000
/* 19D2E8 0029D1E8 00000000 */ .word 0x00000000
/* 19D2EC 0029D1EC 00000000 */ .word 0x00000000
