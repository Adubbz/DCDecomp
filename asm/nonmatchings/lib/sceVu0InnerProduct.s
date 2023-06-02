.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0InnerProduct
/* 21720 00121620 000084D8 */  lqc2       $vf4, 0x0($4)
/* 21724 00121624 0000A5D8 */  lqc2       $vf5, 0x0($5)
/* 21728 00121628 6A21C54B */  vmul.xyz   $vf5, $vf4, $vf5
/* 2172C 0012162C 4129054B */  vaddy.x    $vf5, $vf5, $vf5y
/* 21730 00121630 4229054B */  vaddz.x    $vf5, $vf5, $vf5z
/* 21734 00121634 00282248 */  qmfc2      $2, $vf5
/* 21738 00121638 00008244 */  mtc1       $2, $f0
/* 2173C 0012163C 0800E003 */  jr         $31
/* 21740 00121640 00000000 */   nop
/* 21744 00121644 00000000 */  nop
