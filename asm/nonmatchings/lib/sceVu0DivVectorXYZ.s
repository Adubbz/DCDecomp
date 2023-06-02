.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0DivVectorXYZ
/* 21858 00121758 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2185C 0012175C 00600844 */  mfc1       $8, $f12
/* 21860 00121760 0028A848 */  qmtc2      $8, $vf5
/* 21864 00121764 BC03654A */  vdiv       Q, $vf0w, $vf5x
/* 21868 00121768 BF03004A */  vwaitq
/* 2186C 0012176C 1C21C04B */  vmulq.xyz  $vf4, $vf4, Q
/* 21870 00121770 0800E003 */  jr         $31
/* 21874 00121774 000084F8 */   sqc2      $vf4, 0x0($4)
