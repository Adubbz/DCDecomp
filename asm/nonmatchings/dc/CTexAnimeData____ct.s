.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CTexAnimeDataFv
/* 671A0 001670A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 671A4 001670A4 1000BF7F */  sq         $31, 0x10($sp)
/* 671A8 001670A8 0000B07F */  sq         $16, 0x0($sp)
/* 671AC 001670AC 28868070 */  paddub     $16, $4, $0
/* 671B0 001670B0 349C050C */  jal        Initialize__13CTexAnimeDataFv
/* 671B4 001670B4 00000000 */   nop
/* 671B8 001670B8 28160072 */  paddub     $2, $16, $0
/* 671BC 001670BC 1000BF7B */  lq         $31, 0x10($sp)
/* 671C0 001670C0 0000B07B */  lq         $16, 0x0($sp)
/* 671C4 001670C4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 671C8 001670C8 0800E003 */  jr         $31
/* 671CC 001670CC 00000000 */   nop
