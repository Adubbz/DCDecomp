.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPosition__10CCharacterFPf
/* 391B0 001390B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 391B4 001390B4 0000BF7F */  sq         $31, 0x0($sp)
/* 391B8 001390B8 28168070 */  paddub     $2, $4, $0
/* 391BC 001390BC 2826A070 */  paddub     $4, $5, $0
/* 391C0 001390C0 10004524 */  addiu      $5, $2, 0x10
/* 391C4 001390C4 0C86040C */  jal        sceVu0CopyVector
/* 391C8 001390C8 00000000 */   nop
/* 391CC 001390CC 0000BF7B */  lq         $31, 0x0($sp)
/* 391D0 001390D0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 391D4 001390D4 0800E003 */  jr         $31
/* 391D8 001390D8 00000000 */   nop
/* 391DC 001390DC 00000000 */  nop
