.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWeaponData__Fi
/* 0D1050 001D0F50 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0D1054 001D0F54 0000BF7F */  sq          $31, 0x0($29)
/* 0D1058 001D0F58 1C00A527 */  addiu       $5, $29, 0x1C
/* 0D105C 001D0F5C 8C43070C */  jal         GetItemTypeInfo__FiPc
/* 0D1060 001D0F60 00000000 */   nop
/* 0D1064 001D0F64 1C00A483 */  lb          $4, 0x1C($29)
/* 0D1068 001D0F68 02000324 */  addiu       $3, $0, 0x2
/* 0D106C 001D0F6C 0E008314 */  bne         $4, $3, .L001D0FA8
/* 0D1070 001D0F70 00000000 */   nop
/* 0D1074 001D0F74 2A084000 */  slt         $1, $2, $0
/* 0D1078 001D0F78 0B002014 */  bnez        $1, .L001D0FA8
/* 0D107C 001D0F7C 00000000 */   nop
/* 0D1080 001D0F80 C0180200 */  sll         $3, $2, 3
/* 0D1084 001D0F84 21186200 */  addu        $3, $3, $2
/* 0D1088 001D0F88 40180300 */  sll         $3, $3, 1
/* 0D108C 001D0F8C 21106200 */  addu        $2, $3, $2
/* 0D1090 001D0F90 80180200 */  sll         $3, $2, 2
/* 0D1094 001D0F94 2800023C */  lui         $2, %hi(WeaponList)
/* 0D1098 001D0F98 C0A64224 */  addiu       $2, $2, %lo(WeaponList)
/* 0D109C 001D0F9C 21104300 */  addu        $2, $2, $3
/* 0D10A0 001D0FA0 02000010 */  b           .L001D0FAC
/* 0D10A4 001D0FA4 00000000 */   nop
.L001D0FA8:
/* 0D10A8 001D0FA8 28160070 */  paddub      $2, $0, $0
.L001D0FAC:
/* 0D10AC 001D0FAC 0000BF7B */  lq          $31, 0x0($29)
/* 0D10B0 001D0FB0 2000BD27 */  addiu       $29, $29, 0x20
/* 0D10B4 001D0FB4 0800E003 */  jr          $31
/* 0D10B8 001D0FB8 00000000 */   nop
/* 0D10BC 001D0FBC 00000000 */  nop
