.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetFishingRankData__Fi
/* 0F2F50 001F2E50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F2F54 001F2E54 0000BF7F */  sq          $31, 0x0($29)
/* 0F2F58 001F2E58 282E8070 */  paddub      $5, $4, $0
/* 0F2F5C 001F2E5C 1C8D848F */  lw          $4, -0x72E4($28)
/* 0F2F60 001F2E60 D05F050C */  jal         GetFishingRank__9CSaveDataFi
/* 0F2F64 001F2E64 00000000 */   nop
/* 0F2F68 001F2E68 0000BF7B */  lq          $31, 0x0($29)
/* 0F2F6C 001F2E6C 1000BD27 */  addiu       $29, $29, 0x10
/* 0F2F70 001F2E70 0800E003 */  jr          $31
/* 0F2F74 001F2E74 00000000 */   nop
/* 0F2F78 001F2E78 00000000 */  nop
/* 0F2F7C 001F2E7C 00000000 */  nop
