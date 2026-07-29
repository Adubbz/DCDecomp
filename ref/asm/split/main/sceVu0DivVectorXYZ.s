.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0DivVectorXYZ
/* 021858 00121758 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02185C 0012175C 00600844 */  mfc1        $8, $f12
/* 021860 00121760 0028A848 */  qmtc2.ni    $8, $vf5
/* 021864 00121764 BC03654A */  vdiv        $Q, $vf0w, $vf5x
/* 021868 00121768 BF03004A */  vwaitq
/* 02186C 0012176C 1C21C04B */  vmulq.xyz   $vf4, $vf4, $Q
/* 021870 00121770 0800E003 */  jr          $31
/* 021874 00121774 000084F8 */   sqc2       $vf4, 0x0($4)
