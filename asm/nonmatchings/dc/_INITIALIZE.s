.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _INITIALIZE__FP12RS_STACKDATAi
/* 8BE70 0018BD70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8BE74 0018BD74 0000BF7F */  sq         $31, 0x0($sp)
/* 8BE78 0018BD78 885C060C */  jal        EdInitEventParam__Fv
/* 8BE7C 0018BD7C 00000000 */   nop
/* 8BE80 0018BD80 01000224 */  addiu      $2, $0, 0x1
/* 8BE84 0018BD84 0000BF7B */  lq         $31, 0x0($sp)
/* 8BE88 0018BD88 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8BE8C 0018BD8C 0800E003 */  jr         $31
/* 8BE90 0018BD90 00000000 */   nop
/* 8BE94 0018BD94 00000000 */  nop
/* 8BE98 0018BD98 00000000 */  nop
/* 8BE9C 0018BD9C 00000000 */  nop
