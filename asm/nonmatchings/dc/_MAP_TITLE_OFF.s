.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _MAP_TITLE_OFF__FP12RS_STACKDATAi
/* 940A0 00193FA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 940A4 00193FA4 0000BF7F */  sq         $31, 0x0($sp)
/* 940A8 00193FA8 EC4F050C */  jal        now_loading_off__Fv
/* 940AC 00193FAC 00000000 */   nop
/* 940B0 00193FB0 01000224 */  addiu      $2, $0, 0x1
/* 940B4 00193FB4 0000BF7B */  lq         $31, 0x0($sp)
/* 940B8 00193FB8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 940BC 00193FBC 0800E003 */  jr         $31
/* 940C0 00193FC0 00000000 */   nop
/* 940C4 00193FC4 00000000 */  nop
/* 940C8 00193FC8 00000000 */  nop
/* 940CC 00193FCC 00000000 */  nop
