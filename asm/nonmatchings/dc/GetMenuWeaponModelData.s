.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuWeaponModelData__Fi
/* 10D4B0 0020D3B0 80180400 */  sll        $3, $4, 2
/* 10D4B4 0020D3B4 DA01023C */  lui        $2, %hi(MenuWeaponModelData)
/* 10D4B8 0020D3B8 D0ED4224 */  addiu      $2, $2, %lo(MenuWeaponModelData)
/* 10D4BC 0020D3BC 21104300 */  addu       $2, $2, $3
/* 10D4C0 0020D3C0 0800E003 */  jr         $31
/* 10D4C4 0020D3C4 00000000 */   nop
/* 10D4C8 0020D3C8 00000000 */  nop
/* 10D4CC 0020D3CC 00000000 */  nop
