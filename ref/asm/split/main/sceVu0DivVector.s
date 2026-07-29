.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0DivVector
/* 021838 00121738 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02183C 0012173C 00600844 */  mfc1        $8, $f12
/* 021840 00121740 0028A848 */  qmtc2.ni    $8, $vf5
/* 021844 00121744 BC03654A */  vdiv        $Q, $vf0w, $vf5x
/* 021848 00121748 BF03004A */  vwaitq
/* 02184C 0012174C 1C21E04B */  vmulq.xyzw  $vf4, $vf4, $Q
/* 021850 00121750 0800E003 */  jr          $31
/* 021854 00121754 000084F8 */   sqc2       $vf4, 0x0($4)
