.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0ClampVector
/* 21C90 00121B90 00600844 */  mfc1       $8, $f12
/* 21C94 00121B94 00680944 */  mfc1       $9, $f13
/* 21C98 00121B98 0000A6D8 */  lqc2       $vf6, 0x0($5)
/* 21C9C 00121B9C 0020A848 */  qmtc2      $8, $vf4
/* 21CA0 00121BA0 0028A948 */  qmtc2      $9, $vf5
/* 21CA4 00121BA4 9031E44B */  vmaxx.xyzw $vf6, $vf6, $vf4x
/* 21CA8 00121BA8 9431E54B */  vminix.xyzw $vf6, $vf6, $vf5x
/* 21CAC 00121BAC 0800E003 */  jr         $31
/* 21CB0 00121BB0 000086F8 */   sqc2      $vf6, 0x0($4)
/* 21CB4 00121BB4 00000000 */  nop
