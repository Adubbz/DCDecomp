.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtArrengeMonstor__Fv
/* 00D5E0 01DB92E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D5E4 01DB92E4 0000BF7F */  sq          $31, 0x0($29)
/* 00D5E8 01DB92E8 E09C848F */  lw          $4, -0x6320($28)
/* 00D5EC 01DB92EC C49C858F */  lw          $5, -0x633C($28)
/* 00D5F0 01DB92F0 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 00D5F4 01DB92F4 00000000 */   nop
/* 00D5F8 01DB92F8 E09C848F */  lw          $4, -0x6320($28)
/* 00D5FC 01DB92FC DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 00D600 01DB9300 E04B4524 */  addiu       $5, $2, %lo(MainDungeonMap)
/* 00D604 01DB9304 0F000624 */  addiu       $6, $0, 0xF
/* 00D608 01DB9308 FFFF0724 */  addiu       $7, $0, -0x1
/* 00D60C 01DB930C 28460070 */  paddub      $8, $0, $0
/* 00D610 01DB9310 F05F070C */  jal         ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
/* 00D614 01DB9314 00000000 */   nop
/* 00D618 01DB9318 0000BF7B */  lq          $31, 0x0($29)
/* 00D61C 01DB931C 1000BD27 */  addiu       $29, $29, 0x10
/* 00D620 01DB9320 0800E003 */  jr          $31
/* 00D624 01DB9324 00000000 */   nop
/* 00D628 01DB9328 00000000 */  nop
/* 00D62C 01DB932C 00000000 */  nop
