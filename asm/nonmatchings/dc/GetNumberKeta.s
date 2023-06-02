.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNumberKeta__Fi
/* 12E000 0022DF00 01000224 */  addiu      $2, $0, 0x1
/* 12E004 0022DF04 08000010 */  b          .L0022DF28
/* 12E008 0022DF08 00000000 */   nop
.L0022DF0C:
/* 12E00C 0022DF0C 0A000324 */  addiu      $3, $0, 0xA
/* 12E010 0022DF10 1A008300 */  div        $0, $4, $3
/* 12E014 0022DF14 02006014 */  bnez       $3, .L0022DF20
/* 12E018 0022DF18 00000000 */   nop
/* 12E01C 0022DF1C CD010000 */  break      0, 7
.L0022DF20:
/* 12E020 0022DF20 12200000 */  mflo       $4
/* 12E024 0022DF24 01004224 */  addiu      $2, $2, 0x1
.L0022DF28:
/* 12E028 0022DF28 0A008128 */  slti       $at, $4, 0xA
/* 12E02C 0022DF2C F7FF2010 */  beqz       $at, .L0022DF0C
/* 12E030 0022DF30 00000000 */   nop
/* 12E034 0022DF34 0800E003 */  jr         $31
/* 12E038 0022DF38 00000000 */   nop
/* 12E03C 0022DF3C 00000000 */  nop
