.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _dpfge
/* 000280 00100180 F0FFBD27 */  addiu       $29, $29, -0x10
/* 000284 00100184 0000BF7F */  sq          $31, 0x0($29)
/* 000288 00100188 E840040C */  jal         dpcmp
/* 00028C 0010018C 00000000 */   nop
/* 000290 00100190 0000BF7B */  lq          $31, 0x0($29)
/* 000294 00100194 2A104000 */  slt         $2, $2, $0
/* 000298 00100198 01004238 */  xori        $2, $2, 0x1
/* 00029C 0010019C 0800E003 */  jr          $31
/* 0002A0 001001A0 1000BD27 */   addiu      $29, $29, 0x10
/* 0002A4 001001A4 00000000 */  nop
