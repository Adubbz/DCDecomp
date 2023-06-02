.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AllFadeForMenu__Fi
/* 12D380 0022D280 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12D384 0022D284 0000BF7F */  sq         $31, 0x0($sp)
/* 12D388 0022D288 FF008730 */  andi       $7, $4, 0xFF
/* 12D38C 0022D28C 28260070 */  paddub     $4, $0, $0
/* 12D390 0022D290 282E0070 */  paddub     $5, $0, $0
/* 12D394 0022D294 28360070 */  paddub     $6, $0, $0
/* 12D398 0022D298 6CB4080C */  jal        AllFillBoxForMenu__FUcUcUcUc
/* 12D39C 0022D29C 00000000 */   nop
/* 12D3A0 0022D2A0 0000BF7B */  lq         $31, 0x0($sp)
/* 12D3A4 0022D2A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12D3A8 0022D2A8 0800E003 */  jr         $31
/* 12D3AC 0022D2AC 00000000 */   nop
