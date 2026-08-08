.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel S3
/* 198980 00298880 D561C119 */ .word 0x19C161D5
/* 198984 00298884 A0012ABF */ .word 0xBF2A01A0
