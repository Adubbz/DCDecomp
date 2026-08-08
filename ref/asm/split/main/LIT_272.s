.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_272
/* 199DD0 00299CD0 73656E74 */ .word 0x746E6573
/* 199DD4 00299CD4 616B7500 */ .word GlobalDataBuffer + 0x4ABAE1
