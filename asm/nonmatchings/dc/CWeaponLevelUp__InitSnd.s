.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitSnd__14CWeaponLevelUpFv
/* 136F90 00236E90 FFFF0324 */  addiu      $3, $0, -0x1
/* 136F94 00236E94 181383A4 */  sh         $3, 0x1318($4)
/* 136F98 00236E98 161380A4 */  sh         $0, 0x1316($4)
/* 136F9C 00236E9C 1A1380A4 */  sh         $0, 0x131A($4)
/* 136FA0 00236EA0 1C1380A4 */  sh         $0, 0x131C($4)
/* 136FA4 00236EA4 0800E003 */  jr         $31
/* 136FA8 00236EA8 00000000 */   nop
/* 136FAC 00236EAC 00000000 */  nop
