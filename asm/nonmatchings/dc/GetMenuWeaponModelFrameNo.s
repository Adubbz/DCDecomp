.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuWeaponModelFrameNo__Fi
/* 10D5A0 0020D4A0 C0180400 */  sll        $3, $4, 3
/* 10D5A4 0020D4A4 DA01023C */  lui        $2, %hi(MenuWeaponModelInfo)
/* 10D5A8 0020D4A8 80EE4224 */  addiu      $2, $2, %lo(MenuWeaponModelInfo)
/* 10D5AC 0020D4AC 21104300 */  addu       $2, $2, $3
/* 10D5B0 0020D4B0 0000428C */  lw         $2, 0x0($2)
/* 10D5B4 0020D4B4 0800E003 */  jr         $31
/* 10D5B8 0020D4B8 00000000 */   nop
/* 10D5BC 0020D4BC 00000000 */  nop
