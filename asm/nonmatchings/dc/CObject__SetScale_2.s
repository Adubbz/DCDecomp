.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetScale__7CObjectFPf
/* 570D0 00156FD0 0000A0C4 */  lwc1       $f0, 0x0($5)
/* 570D4 00156FD4 900080E4 */  swc1       $f0, 0x90($4)
/* 570D8 00156FD8 0400A0C4 */  lwc1       $f0, 0x4($5)
/* 570DC 00156FDC 940080E4 */  swc1       $f0, 0x94($4)
/* 570E0 00156FE0 0800A0C4 */  lwc1       $f0, 0x8($5)
/* 570E4 00156FE4 980080E4 */  swc1       $f0, 0x98($4)
/* 570E8 00156FE8 0800E003 */  jr         $31
/* 570EC 00156FEC 00000000 */   nop
