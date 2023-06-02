.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuWeaponModelInfo__Fi
/* 10D500 0020D400 C0180400 */  sll        $3, $4, 3
/* 10D504 0020D404 DA01023C */  lui        $2, %hi(MenuWeaponModelInfo)
/* 10D508 0020D408 80EE4224 */  addiu      $2, $2, %lo(MenuWeaponModelInfo)
/* 10D50C 0020D40C 21104300 */  addu       $2, $2, $3
/* 10D510 0020D410 0800E003 */  jr         $31
/* 10D514 0020D414 00000000 */   nop
/* 10D518 0020D418 00000000 */  nop
/* 10D51C 0020D41C 00000000 */  nop
