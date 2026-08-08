.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2755
/* 19AF30 0029AE30 696D672F */ .word 0x2F676D69
/* 19AF34 0029AE34 616E6B66 */ .word 0x666B6E61
/* 19AF38 0029AE38 6F6E742E */ .word 0x2E746E6F
/* 19AF3C 0029AE3C 696D6700 */ .word GlobalDataBuffer + 0x3CBCE9
