.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0TransMatrix
/* 21900 00121800 0000C4D8 */  lqc2       $vf4, 0x0($6)
/* 21904 00121804 3000A5D8 */  lqc2       $vf5, 0x30($5)
/* 21908 00121808 0000A778 */  lq         $7, 0x0($5)
/* 2190C 0012180C 1000A878 */  lq         $8, 0x10($5)
/* 21910 00121810 2000A978 */  lq         $9, 0x20($5)
/* 21914 00121814 6829C44B */  vadd.xyz   $vf5, $vf5, $vf4
/* 21918 00121818 0000877C */  sq         $7, 0x0($4)
/* 2191C 0012181C 1000887C */  sq         $8, 0x10($4)
/* 21920 00121820 2000897C */  sq         $9, 0x20($4)
/* 21924 00121824 0800E003 */  jr         $31
/* 21928 00121828 300085F8 */   sqc2      $vf5, 0x30($4)
/* 2192C 0012182C 00000000 */  nop
