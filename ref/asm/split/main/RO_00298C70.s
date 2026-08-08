.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00298C70
/* 198D70 00298C70 4641494C */ .word 0x4C494146
/* 198D74 00298C74 45440000 */ .word 0x00004445
