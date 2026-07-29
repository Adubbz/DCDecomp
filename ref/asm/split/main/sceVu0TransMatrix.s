.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0TransMatrix
/* 021900 00121800 0000C4D8 */  lqc2        $vf4, 0x0($6)
/* 021904 00121804 3000A5D8 */  lqc2        $vf5, 0x30($5)
/* 021908 00121808 0000A778 */  lq          $7, 0x0($5)
/* 02190C 0012180C 1000A878 */  lq          $8, 0x10($5)
/* 021910 00121810 2000A978 */  lq          $9, 0x20($5)
/* 021914 00121814 6829C44B */  vadd.xyz    $vf5, $vf5, $vf4
/* 021918 00121818 0000877C */  sq          $7, 0x0($4)
/* 02191C 0012181C 1000887C */  sq          $8, 0x10($4)
/* 021920 00121820 2000897C */  sq          $9, 0x20($4)
/* 021924 00121824 0800E003 */  jr          $31
/* 021928 00121828 300085F8 */   sqc2       $vf5, 0x30($4)
/* 02192C 0012182C 00000000 */  nop
