.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ExitManualMenu__Fv
/* 134590 00234490 E0FFBD27 */  addiu       $29, $29, -0x20
/* 134594 00234494 0000BF7F */  sq          $31, 0x0($29)
/* 134598 00234498 2900023C */  lui         $2, %hi(LIT_607__3)
/* 13459C 0023449C F0574224 */  addiu       $2, $2, %lo(LIT_607__3)
/* 1345A0 002344A0 1000A427 */  addiu       $4, $29, 0x10
/* 1345A4 002344A4 00004278 */  lq          $2, 0x0($2)
/* 1345A8 002344A8 0000827C */  sq          $2, 0x0($4)
/* 1345AC 002344AC DB01013C */  lui         $1, %hi(ManualMenu)
/* 1345B0 002344B0 70A82284 */  lh          $2, %lo(ManualMenu)($1)
/* 1345B4 002344B4 1000A2AF */  sw          $2, 0x10($29)
/* 1345B8 002344B8 DB01013C */  lui         $1, %hi(ManualMenu + 0x2)
/* 1345BC 002344BC 72A82284 */  lh          $2, %lo(ManualMenu + 0x2)($1)
/* 1345C0 002344C0 1400A2AF */  sw          $2, 0x14($29)
/* 1345C4 002344C4 DB01013C */  lui         $1, %hi(ManualMenu + 0x4)
/* 1345C8 002344C8 74A82284 */  lh          $2, %lo(ManualMenu + 0x4)($1)
/* 1345CC 002344CC 1800A2AF */  sw          $2, 0x18($29)
/* 1345D0 002344D0 4CB4080C */  jal         MenuTextureDelete__FPi
/* 1345D4 002344D4 00000000 */   nop
/* 1345D8 002344D8 01000324 */  addiu       $3, $0, 0x1
/* 1345DC 002344DC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16CC)
/* 1345E0 002344E0 DC5123AC */  sw          $3, %lo(CommonMenuMes3 + 0x16CC)($1)
/* 1345E4 002344E4 FFFF0324 */  addiu       $3, $0, -0x1
/* 1345E8 002344E8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1740)
/* 1345EC 002344EC 505223AC */  sw          $3, %lo(CommonMenuMes3 + 0x1740)($1)
/* 1345F0 002344F0 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x98)
/* 1345F4 002344F4 A83B20AC */  sw          $0, %lo(CommonMenuMes3 + 0x98)($1)
/* 1345F8 002344F8 AC97848F */  lw          $4, -0x6854($28)
/* 1345FC 002344FC 401783AC */  sw          $3, 0x1740($4)
/* 134600 00234500 AC97838F */  lw          $3, -0x6854($28)
/* 134604 00234504 980060AC */  sw          $0, 0x98($3)
/* 134608 00234508 0000BF7B */  lq          $31, 0x0($29)
/* 13460C 0023450C 2000BD27 */  addiu       $29, $29, 0x20
/* 134610 00234510 0800E003 */  jr          $31
/* 134614 00234514 00000000 */   nop
/* 134618 00234518 00000000 */  nop
/* 13461C 0023451C 00000000 */  nop
