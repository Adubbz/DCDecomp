.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel closeGiftag__FP13sceVif1Packet
/* 3E000 0013DF00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3E004 0013DF04 1000BF7F */  sq         $31, 0x10($sp)
/* 3E008 0013DF08 0000B07F */  sq         $16, 0x0($sp)
/* 3E00C 0013DF0C 28868070 */  paddub     $16, $4, $0
/* 3E010 0013DF10 B683040C */  jal        sceVif1PkCloseGifTag
/* 3E014 0013DF14 00000000 */   nop
/* 3E018 0013DF18 28260072 */  paddub     $4, $16, $0
/* 3E01C 0013DF1C A483040C */  jal        sceVif1PkCloseDirectCode
/* 3E020 0013DF20 00000000 */   nop
/* 3E024 0013DF24 1000BF7B */  lq         $31, 0x10($sp)
/* 3E028 0013DF28 0000B07B */  lq         $16, 0x0($sp)
/* 3E02C 0013DF2C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 3E030 0013DF30 0800E003 */  jr         $31
/* 3E034 0013DF34 00000000 */   nop
/* 3E038 0013DF38 00000000 */  nop
/* 3E03C 0013DF3C 00000000 */  nop
