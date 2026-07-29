.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ScaleVectorXYZ
/* 022218 00122118 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02221C 0012211C 00600844 */  mfc1        $8, $f12
/* 022220 00122120 0028A848 */  qmtc2.ni    $8, $vf5
/* 022224 00122124 1821C54B */  vmulx.xyz   $vf4, $vf4, $vf5x
/* 022228 00122128 0800E003 */  jr          $31
/* 02222C 0012212C 000084F8 */   sqc2       $vf4, 0x0($4)
