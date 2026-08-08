.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_288
/* 199CD0 00299BD0 25732F74 */ .word 0x742F7325
/* 199CD4 00299BD4 69746C65 */ .word 0x656C7469
/* 199CD8 00299BD8 2E696D67 */ .word 0x676D692E
/* 199CDC 00299BDC 00000000 */ .word 0x00000000
