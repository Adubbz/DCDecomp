.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtMiniChrSelect_Init__Fi
/* 0D3390 001D3290 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0D3394 001D3294 1000BF7F */  sq          $31, 0x10($29)
/* 0D3398 001D3298 0000B07F */  sq          $16, 0x0($29)
/* 0D339C 001D329C 28868070 */  paddub      $16, $4, $0
/* 0D33A0 001D32A0 28260070 */  paddub      $4, $0, $0
/* 0D33A4 001D32A4 B004770C */  jal         SetMIniMapStatus__Fi
/* 0D33A8 001D32A8 00000000 */   nop
/* 0D33AC 001D32AC EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D33B0 001D32B0 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 0D33B4 001D32B4 4C9480AF */  sw          $0, -0x6BB4($28)
/* 0D33B8 001D32B8 509490AF */  sw          $16, -0x6BB0($28)
/* 0D33BC 001D32BC 1000BF7B */  lq          $31, 0x10($29)
/* 0D33C0 001D32C0 0000B07B */  lq          $16, 0x0($29)
/* 0D33C4 001D32C4 2000BD27 */  addiu       $29, $29, 0x20
/* 0D33C8 001D32C8 0800E003 */  jr          $31
/* 0D33CC 001D32CC 00000000 */   nop
