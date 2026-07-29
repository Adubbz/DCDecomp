.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_INTRO_LOOP__FP12RS_STACKDATAi
/* 096910 00196810 E0FFBD27 */  addiu       $29, $29, -0x20
/* 096914 00196814 1000BF7F */  sq          $31, 0x10($29)
/* 096918 00196818 0000B07F */  sq          $16, 0x0($29)
/* 09691C 0019681C 28868070 */  paddub      $16, $4, $0
/* 096920 00196820 70A1050C */  jal         EBIntroLoop__Fv
/* 096924 00196824 00000000 */   nop
/* 096928 00196828 28260072 */  paddub      $4, $16, $0
/* 09692C 0019682C 282E4070 */  paddub      $5, $2, $0
/* 096930 00196830 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 096934 00196834 00000000 */   nop
/* 096938 00196838 01000224 */  addiu       $2, $0, 0x1
/* 09693C 0019683C 1000BF7B */  lq          $31, 0x10($29)
/* 096940 00196840 0000B07B */  lq          $16, 0x0($29)
/* 096944 00196844 2000BD27 */  addiu       $29, $29, 0x20
/* 096948 00196848 0800E003 */  jr          $31
/* 09694C 0019684C 00000000 */   nop
