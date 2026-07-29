.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0InnerProduct
/* 021720 00121620 000084D8 */  lqc2        $vf4, 0x0($4)
/* 021724 00121624 0000A5D8 */  lqc2        $vf5, 0x0($5)
/* 021728 00121628 6A21C54B */  vmul.xyz    $vf5, $vf4, $vf5
/* 02172C 0012162C 4129054B */  vaddy.x     $vf5, $vf5, $vf5y
/* 021730 00121630 4229054B */  vaddz.x     $vf5, $vf5, $vf5z
/* 021734 00121634 00282248 */  qmfc2.ni    $2, $vf5
/* 021738 00121638 00008244 */  mtc1        $2, $f0
/* 02173C 0012163C 0800E003 */  jr          $31
/* 021740 00121640 00000000 */   nop
/* 021744 00121644 00000000 */  nop
