.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetScale__7CObjectFPf
/* 570F0 00156FF0 900080C4 */  lwc1       $f0, 0x90($4)
/* 570F4 00156FF4 0000A0E4 */  swc1       $f0, 0x0($5)
/* 570F8 00156FF8 940080C4 */  lwc1       $f0, 0x94($4)
/* 570FC 00156FFC 0400A0E4 */  swc1       $f0, 0x4($5)
/* 57100 00157000 980080C4 */  lwc1       $f0, 0x98($4)
/* 57104 00157004 0800A0E4 */  swc1       $f0, 0x8($5)
/* 57108 00157008 0800E003 */  jr         $31
/* 5710C 0015700C 00000000 */   nop
