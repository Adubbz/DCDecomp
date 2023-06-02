.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0Normalize
/* 21748 00121648 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2174C 0012164C 6A21C44B */  vmul.xyz   $vf5, $vf4, $vf4
/* 21750 00121650 4129054B */  vaddy.x    $vf5, $vf5, $vf5y
/* 21754 00121654 4229054B */  vaddz.x    $vf5, $vf5, $vf5z
/* 21758 00121658 BD03054A */  vsqrt      Q, $vf5x
/* 2175C 0012165C BF03004A */  vwaitq
/* 21760 00121660 6001004B */  vaddq.x    $vf5, $vf0, Q
/* 21764 00121664 BC03654A */  vdiv       Q, $vf0w, $vf5x
/* 21768 00121668 AC01E04B */  vsub.xyzw  $vf6, $vf0, $vf0
/* 2176C 0012166C BF03004A */  vwaitq
/* 21770 00121670 9C21C04B */  vmulq.xyz  $vf6, $vf4, Q
/* 21774 00121674 0800E003 */  jr         $31
/* 21778 00121678 000086F8 */   sqc2      $vf6, 0x0($4)
/* 2177C 0012167C 00000000 */  nop
