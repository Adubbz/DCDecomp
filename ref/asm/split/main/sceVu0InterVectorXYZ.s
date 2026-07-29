.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0InterVectorXYZ
/* 0221E8 001220E8 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 0221EC 001220EC 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 0221F0 001220F0 00600844 */  mfc1        $8, $f12
/* 0221F4 001220F4 0030A848 */  qmtc2.ni    $8, $vf6
/* 0221F8 001220F8 3C23294A */  vmove.w     $vf9, $vf4
/* 0221FC 001220FC C301004B */  vaddw.x     $vf7, $vf0, $vf0w
/* 022200 00122100 2C3A064B */  vsub.x      $vf8, $vf7, $vf6
/* 022204 00122104 BC21C64B */  vmulax.xyz  $ACC, $vf4, $vf6x
/* 022208 00122108 482AC84B */  vmaddx.xyz  $vf9, $vf5, $vf8x
/* 02220C 0012210C 0800E003 */  jr          $31
/* 022210 00122110 000089F8 */   sqc2       $vf9, 0x0($4)
/* 022214 00122114 00000000 */  nop
