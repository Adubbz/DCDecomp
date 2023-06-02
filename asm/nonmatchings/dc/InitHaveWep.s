.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitHaveWep__FP11WEAPON_HAVE
/* 12E570 0022E470 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12E574 0022E474 1000BF7F */  sq         $31, 0x10($sp)
/* 12E578 0022E478 0000B07F */  sq         $16, 0x0($sp)
/* 12E57C 0022E47C 28868070 */  paddub     $16, $4, $0
/* 12E580 0022E480 282E0070 */  paddub     $5, $0, $0
/* 12E584 0022E484 F8000624 */  addiu      $6, $0, 0xF8
/* 12E588 0022E488 5A0D040C */  jal        memset
/* 12E58C 0022E48C 00000000 */   nop
/* 12E590 0022E490 FFFF0324 */  addiu      $3, $0, -0x1
/* 12E594 0022E494 000003A6 */  sh         $3, 0x0($16)
/* 12E598 0022E498 1000BF7B */  lq         $31, 0x10($sp)
/* 12E59C 0022E49C 0000B07B */  lq         $16, 0x0($sp)
/* 12E5A0 0022E4A0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12E5A4 0022E4A4 0800E003 */  jr         $31
/* 12E5A8 0022E4A8 00000000 */   nop
/* 12E5AC 0022E4AC 00000000 */  nop
