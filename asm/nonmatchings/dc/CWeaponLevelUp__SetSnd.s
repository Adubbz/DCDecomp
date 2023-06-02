.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSnd__14CWeaponLevelUpFiii
/* 136FB0 00236EB0 181385A4 */  sh         $5, 0x1318($4)
/* 136FB4 00236EB4 18138384 */  lh         $3, 0x1318($4)
/* 136FB8 00236EB8 161383A4 */  sh         $3, 0x1316($4)
/* 136FBC 00236EBC 1A1386A4 */  sh         $6, 0x131A($4)
/* 136FC0 00236EC0 2A08C500 */  slt        $at, $6, $5
/* 136FC4 00236EC4 03002010 */  beqz       $at, .L00236ED4
/* 136FC8 00236EC8 00000000 */   nop
/* 136FCC 00236ECC 23180700 */  negu       $3, $7
/* 136FD0 00236ED0 1C1383A4 */  sh         $3, 0x131C($4)
.L00236ED4:
/* 136FD4 00236ED4 2A08A600 */  slt        $at, $5, $6
/* 136FD8 00236ED8 02002010 */  beqz       $at, .L00236EE4
/* 136FDC 00236EDC 00000000 */   nop
/* 136FE0 00236EE0 1C1387A4 */  sh         $7, 0x131C($4)
.L00236EE4:
/* 136FE4 00236EE4 0800E003 */  jr         $31
/* 136FE8 00236EE8 00000000 */   nop
/* 136FEC 00236EEC 00000000 */  nop
