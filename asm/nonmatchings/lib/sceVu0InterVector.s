.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0InterVector
/* 21878 00121778 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2187C 0012177C 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 21880 00121780 00600844 */  mfc1       $8, $f12
/* 21884 00121784 0030A848 */  qmtc2      $8, $vf6
/* 21888 00121788 C301004B */  vaddw.x    $vf7, $vf0, $vf0w
/* 2188C 0012178C 2C3A064B */  vsub.x     $vf8, $vf7, $vf6
/* 21890 00121790 BC21E64B */  vmulax.xyzw ACC, $vf4, $vf6x
/* 21894 00121794 482AE84B */  vmaddx.xyzw $vf9, $vf5, $vf8x
/* 21898 00121798 0800E003 */  jr         $31
/* 2189C 0012179C 000089F8 */   sqc2      $vf9, 0x0($4)
