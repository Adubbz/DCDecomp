.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuCommonFontW__Fii
/* 12C190 0022C090 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12C194 0022C094 0800A527 */  addiu      $5, $sp, 0x8
/* 12C198 0022C098 B08980C7 */  lwc1       $f0, -0x7650($gp)
/* 12C19C 0022C09C B4898387 */  lh         $3, -0x764C($gp)
/* 12C1A0 0022C0A0 B6898293 */  lbu        $2, -0x764A($gp)
/* 12C1A4 0022C0A4 0000A0E4 */  swc1       $f0, 0x0($5)
/* 12C1A8 0022C0A8 0400A3A4 */  sh         $3, 0x4($5)
/* 12C1AC 0022C0AC 0600A2A0 */  sb         $2, 0x6($5)
/* 12C1B0 0022C0B0 21109D00 */  addu       $2, $4, $sp
/* 12C1B4 0022C0B4 08004280 */  lb         $2, 0x8($2)
/* 12C1B8 0022C0B8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12C1BC 0022C0BC 0800E003 */  jr         $31
/* 12C1C0 0022C0C0 00000000 */   nop
/* 12C1C4 0022C0C4 00000000 */  nop
/* 12C1C8 0022C0C8 00000000 */  nop
/* 12C1CC 0022C0CC 00000000 */  nop
