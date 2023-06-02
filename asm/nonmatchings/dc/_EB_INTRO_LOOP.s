.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EB_INTRO_LOOP__FP12RS_STACKDATAi
/* 96910 00196810 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 96914 00196814 1000BF7F */  sq         $31, 0x10($sp)
/* 96918 00196818 0000B07F */  sq         $16, 0x0($sp)
/* 9691C 0019681C 28868070 */  paddub     $16, $4, $0
/* 96920 00196820 70A1050C */  jal        EBIntroLoop__Fv
/* 96924 00196824 00000000 */   nop
/* 96928 00196828 28260072 */  paddub     $4, $16, $0
/* 9692C 0019682C 282E4070 */  paddub     $5, $2, $0
/* 96930 00196830 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 96934 00196834 00000000 */   nop
/* 96938 00196838 01000224 */  addiu      $2, $0, 0x1
/* 9693C 0019683C 1000BF7B */  lq         $31, 0x10($sp)
/* 96940 00196840 0000B07B */  lq         $16, 0x0($sp)
/* 96944 00196844 2000BD27 */  addiu      $sp, $sp, 0x20
/* 96948 00196848 0800E003 */  jr         $31
/* 9694C 0019684C 00000000 */   nop
