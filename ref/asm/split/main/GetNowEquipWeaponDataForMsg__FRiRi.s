.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNowEquipWeaponDataForMsg__FRiRi
/* 0F3F70 001F3E70 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0F3F74 001F3E74 2000BF7F */  sq          $31, 0x20($29)
/* 0F3F78 001F3E78 1000B17F */  sq          $17, 0x10($29)
/* 0F3F7C 001F3E7C 0000B07F */  sq          $16, 0x0($29)
/* 0F3F80 001F3E80 288E8070 */  paddub      $17, $4, $0
/* 0F3F84 001F3E84 2886A070 */  paddub      $16, $5, $0
/* 0F3F88 001F3E88 DA01013C */  lui         $1, %hi(ItemMenuMode + 0x184)
/* 0F3F8C 001F3E8C 74ED2484 */  lh          $4, %lo(ItemMenuMode + 0x184)($1)
/* 0F3F90 001F3E90 7443070C */  jal         GetCommonItemInfo__Fi
/* 0F3F94 001F3E94 00000000 */   nop
/* 0F3F98 001F3E98 05004010 */  beqz        $2, .L001F3EB0
/* 0F3F9C 001F3E9C 00000000 */   nop
/* 0F3FA0 001F3EA0 06004384 */  lh          $3, 0x6($2)
/* 0F3FA4 001F3EA4 000023AE */  sw          $3, 0x0($17)
/* 0F3FA8 001F3EA8 02000010 */  b           .L001F3EB4
/* 0F3FAC 001F3EAC 00000000 */   nop
.L001F3EB0:
/* 0F3FB0 001F3EB0 000020AE */  sw          $0, 0x0($17)
.L001F3EB4:
/* 0F3FB4 001F3EB4 DA01013C */  lui         $1, %hi(ItemMenuMode + 0x186)
/* 0F3FB8 001F3EB8 76ED2384 */  lh          $3, %lo(ItemMenuMode + 0x186)($1)
/* 0F3FBC 001F3EBC 000003AE */  sw          $3, 0x0($16)
/* 0F3FC0 001F3EC0 2000BF7B */  lq          $31, 0x20($29)
/* 0F3FC4 001F3EC4 1000B17B */  lq          $17, 0x10($29)
/* 0F3FC8 001F3EC8 0000B07B */  lq          $16, 0x0($29)
/* 0F3FCC 001F3ECC 3000BD27 */  addiu       $29, $29, 0x30
/* 0F3FD0 001F3ED0 0800E003 */  jr          $31
/* 0F3FD4 001F3ED4 00000000 */   nop
/* 0F3FD8 001F3ED8 00000000 */  nop
/* 0F3FDC 001F3EDC 00000000 */  nop
