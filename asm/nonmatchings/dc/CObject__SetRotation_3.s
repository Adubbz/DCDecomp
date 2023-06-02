.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__7CObjectFPf
/* 56F00 00156E00 0000A0C4 */  lwc1       $f0, 0x0($5)
/* 56F04 00156E04 600080E4 */  swc1       $f0, 0x60($4)
/* 56F08 00156E08 0400A0C4 */  lwc1       $f0, 0x4($5)
/* 56F0C 00156E0C 640080E4 */  swc1       $f0, 0x64($4)
/* 56F10 00156E10 0800A0C4 */  lwc1       $f0, 0x8($5)
/* 56F14 00156E14 680080E4 */  swc1       $f0, 0x68($4)
/* 56F18 00156E18 0800E003 */  jr         $31
/* 56F1C 00156E1C 00000000 */   nop
