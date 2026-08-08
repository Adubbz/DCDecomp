.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2806
/* 19AF98 0029AE98 73797374 */ .word 0x74737973
/* 19AF9C 0029AE9C 30342E69 */ .word 0x692E3430
/* 19AFA0 0029AEA0 6D670000 */ .word 0x0000676D
/* 19AFA4 0029AEA4 00000000 */ .word 0x00000000
/* 19AFA8 0029AEA8 00000000 */ .word 0x00000000
/* 19AFAC 0029AEAC 00000000 */ .word 0x00000000
