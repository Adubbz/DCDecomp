.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_001434F0
/* 0435F0 001434F0 A40680AC */  sw          $0, 0x6A4($4)
/* 0435F4 001434F4 A00680AC */  sw          $0, 0x6A0($4)
/* 0435F8 001434F8 0800E003 */  jr          $31
/* 0435FC 001434FC 00000000 */   nop
