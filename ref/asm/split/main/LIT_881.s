.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_881
/* 199590 00299490 696D672F */ .word 0x2F676D69
/* 199594 00299494 616E6B66 */ .word 0x666B6E61
/* 199598 00299498 6F6E742E */ .word 0x2E746E6F
/* 19959C 0029949C 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
