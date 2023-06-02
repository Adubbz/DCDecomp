.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__12CategoryAttrFv
/* 43510 00143410 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43514 00143414 1000BF7F */  sq         $31, 0x10($sp)
/* 43518 00143418 0000B07F */  sq         $16, 0x0($sp)
/* 4351C 0014341C 28868070 */  paddub     $16, $4, $0
/* 43520 00143420 100D050C */  jal        Initialize__12CategoryAttrFv
/* 43524 00143424 00000000 */   nop
/* 43528 00143428 28160072 */  paddub     $2, $16, $0
/* 4352C 0014342C 1000BF7B */  lq         $31, 0x10($sp)
/* 43530 00143430 0000B07B */  lq         $16, 0x0($sp)
/* 43534 00143434 2000BD27 */  addiu      $sp, $sp, 0x20
/* 43538 00143438 0800E003 */  jr         $31
/* 4353C 0014343C 00000000 */   nop
