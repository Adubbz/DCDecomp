.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAttachInfo__10CStockItemFiP11ATTACH_LIST
/* 13F950 0023F850 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13F954 0023F854 0000BF7F */  sq         $31, 0x0($sp)
/* 13F958 0023F858 40110500 */  sll        $2, $5, 5
/* 13F95C 0023F85C 21108200 */  addu       $2, $4, $2
/* 13F960 0023F860 2826C070 */  paddub     $4, $6, $0
/* 13F964 0023F864 001E4524 */  addiu      $5, $2, 0x1E00
/* 13F968 0023F868 20000624 */  addiu      $6, $0, 0x20
/* 13F96C 0023F86C EC0C040C */  jal        memcpy
/* 13F970 0023F870 00000000 */   nop
/* 13F974 0023F874 0000BF7B */  lq         $31, 0x0($sp)
/* 13F978 0023F878 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13F97C 0023F87C 0800E003 */  jr         $31
/* 13F980 0023F880 00000000 */   nop
/* 13F984 0023F884 00000000 */  nop
/* 13F988 0023F888 00000000 */  nop
/* 13F98C 0023F88C 00000000 */  nop
