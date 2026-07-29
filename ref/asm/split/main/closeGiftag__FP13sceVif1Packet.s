.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel closeGiftag__FP13sceVif1Packet
/* 03E000 0013DF00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 03E004 0013DF04 1000BF7F */  sq          $31, 0x10($29)
/* 03E008 0013DF08 0000B07F */  sq          $16, 0x0($29)
/* 03E00C 0013DF0C 28868070 */  paddub      $16, $4, $0
/* 03E010 0013DF10 B683040C */  jal         sceVif1PkCloseGifTag
/* 03E014 0013DF14 00000000 */   nop
/* 03E018 0013DF18 28260072 */  paddub      $4, $16, $0
/* 03E01C 0013DF1C A483040C */  jal         sceVif1PkCloseDirectCode
/* 03E020 0013DF20 00000000 */   nop
/* 03E024 0013DF24 1000BF7B */  lq          $31, 0x10($29)
/* 03E028 0013DF28 0000B07B */  lq          $16, 0x0($29)
/* 03E02C 0013DF2C 2000BD27 */  addiu       $29, $29, 0x20
/* 03E030 0013DF30 0800E003 */  jr          $31
/* 03E034 0013DF34 00000000 */   nop
/* 03E038 0013DF38 00000000 */  nop
/* 03E03C 0013DF3C 00000000 */  nop
