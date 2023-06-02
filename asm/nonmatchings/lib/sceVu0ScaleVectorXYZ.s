.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0ScaleVectorXYZ
/* 22218 00122118 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2221C 0012211C 00600844 */  mfc1       $8, $f12
/* 22220 00122120 0028A848 */  qmtc2      $8, $vf5
/* 22224 00122124 1821C54B */  vmulx.xyz  $vf4, $vf4, $vf5x
/* 22228 00122128 0800E003 */  jr         $31
/* 2222C 0012212C 000084F8 */   sqc2      $vf4, 0x0($4)
