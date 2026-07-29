.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0Normalize
/* 021748 00121648 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02174C 0012164C 6A21C44B */  vmul.xyz    $vf5, $vf4, $vf4
/* 021750 00121650 4129054B */  vaddy.x     $vf5, $vf5, $vf5y
/* 021754 00121654 4229054B */  vaddz.x     $vf5, $vf5, $vf5z
/* 021758 00121658 BD03054A */  .word       0x4A0503BD                   # vsqrt       $Q, $vf5x # 00000000 <InstrIdType: R5900_COP2_SPECIAL2>
/* 02175C 0012165C BF03004A */  vwaitq
/* 021760 00121660 6001004B */  vaddq.x     $vf5, $vf0, $Q
/* 021764 00121664 BC03654A */  vdiv        $Q, $vf0w, $vf5x
/* 021768 00121668 AC01E04B */  vsub.xyzw   $vf6, $vf0, $vf0
/* 02176C 0012166C BF03004A */  vwaitq
/* 021770 00121670 9C21C04B */  vmulq.xyz   $vf6, $vf4, $Q
/* 021774 00121674 0800E003 */  jr          $31
/* 021778 00121678 000086F8 */   sqc2       $vf6, 0x0($4)
/* 02177C 0012167C 00000000 */  nop
