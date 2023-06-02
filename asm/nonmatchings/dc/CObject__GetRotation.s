.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotation__7CObjectFPf
/* 56FF0 00156EF0 600080C4 */  lwc1       $f0, 0x60($4)
/* 56FF4 00156EF4 0000A0E4 */  swc1       $f0, 0x0($5)
/* 56FF8 00156EF8 640080C4 */  lwc1       $f0, 0x64($4)
/* 56FFC 00156EFC 0400A0E4 */  swc1       $f0, 0x4($5)
/* 57000 00156F00 680080C4 */  lwc1       $f0, 0x68($4)
/* 57004 00156F04 0800A0E4 */  swc1       $f0, 0x8($5)
/* 57008 00156F08 0800E003 */  jr         $31
/* 5700C 00156F0C 00000000 */   nop
