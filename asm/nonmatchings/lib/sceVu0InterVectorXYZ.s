.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0InterVectorXYZ
/* 221E8 001220E8 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 221EC 001220EC 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 221F0 001220F0 00600844 */  mfc1       $8, $f12
/* 221F4 001220F4 0030A848 */  qmtc2      $8, $vf6
/* 221F8 001220F8 3C23294A */  vmove.w    $vf9, $vf4
/* 221FC 001220FC C301004B */  vaddw.x    $vf7, $vf0, $vf0w
/* 22200 00122100 2C3A064B */  vsub.x     $vf8, $vf7, $vf6
/* 22204 00122104 BC21C64B */  vmulax.xyz ACC, $vf4, $vf6x
/* 22208 00122108 482AC84B */  vmaddx.xyz $vf9, $vf5, $vf8x
/* 2220C 0012210C 0800E003 */  jr         $31
/* 22210 00122110 000089F8 */   sqc2      $vf9, 0x0($4)
/* 22214 00122114 00000000 */  nop
