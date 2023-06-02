.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_RANDOM__FP12RS_STACKDATAi
/* 8BBC0 0018BAC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8BBC4 0018BAC4 1000BF7F */  sq         $31, 0x10($sp)
/* 8BBC8 0018BAC8 0000B07F */  sq         $16, 0x0($sp)
/* 8BBCC 0018BACC 28868070 */  paddub     $16, $4, $0
/* 8BBD0 0018BAD0 0400A01C */  bgtz       $5, .L0018BAE4
/* 8BBD4 0018BAD4 00000000 */   nop
/* 8BBD8 0018BAD8 28160070 */  paddub     $2, $0, $0
/* 8BBDC 0018BADC 08000010 */  b          .L0018BB00
/* 8BBE0 0018BAE0 00000000 */   nop
.L0018BAE4:
/* 8BBE4 0018BAE4 BE11040C */  jal        rand
/* 8BBE8 0018BAE8 00000000 */   nop
/* 8BBEC 0018BAEC 28260072 */  paddub     $4, $16, $0
/* 8BBF0 0018BAF0 282E4070 */  paddub     $5, $2, $0
/* 8BBF4 0018BAF4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8BBF8 0018BAF8 00000000 */   nop
/* 8BBFC 0018BAFC 01000224 */  addiu      $2, $0, 0x1
.L0018BB00:
/* 8BC00 0018BB00 1000BF7B */  lq         $31, 0x10($sp)
/* 8BC04 0018BB04 0000B07B */  lq         $16, 0x0($sp)
/* 8BC08 0018BB08 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8BC0C 0018BB0C 0800E003 */  jr         $31
/* 8BC10 0018BB10 00000000 */   nop
/* 8BC14 0018BB14 00000000 */  nop
/* 8BC18 0018BB18 00000000 */  nop
/* 8BC1C 0018BB1C 00000000 */  nop
