.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DisableAll__13CTextureAnimeFv
/* 067BE0 00167AE0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 067BE4 00167AE4 2000BF7F */  sq          $31, 0x20($29)
/* 067BE8 00167AE8 1000B17F */  sq          $17, 0x10($29)
/* 067BEC 00167AEC 0000B07F */  sq          $16, 0x0($29)
/* 067BF0 00167AF0 288E8070 */  paddub      $17, $4, $0
/* 067BF4 00167AF4 28860070 */  paddub      $16, $0, $0
/* 067BF8 00167AF8 06000010 */  b           .L00167B14
/* 067BFC 00167AFC 00000000 */   nop
.L00167B00:
/* 067C00 00167B00 28262072 */  paddub      $4, $17, $0
/* 067C04 00167B04 282E0072 */  paddub      $5, $16, $0
/* 067C08 00167B08 E09E050C */  jal         Disable__13CTextureAnimeFi
/* 067C0C 00167B0C 00000000 */   nop
/* 067C10 00167B10 01001026 */  addiu       $16, $16, 0x1
.L00167B14:
/* 067C14 00167B14 1800032A */  slti        $3, $16, 0x18
/* 067C18 00167B18 F9FF6014 */  bnez        $3, .L00167B00
/* 067C1C 00167B1C 00000000 */   nop
/* 067C20 00167B20 2000BF7B */  lq          $31, 0x20($29)
/* 067C24 00167B24 1000B17B */  lq          $17, 0x10($29)
/* 067C28 00167B28 0000B07B */  lq          $16, 0x0($29)
/* 067C2C 00167B2C 3000BD27 */  addiu       $29, $29, 0x30
/* 067C30 00167B30 0800E003 */  jr          $31
/* 067C34 00167B34 00000000 */   nop
/* 067C38 00167B38 00000000 */  nop
/* 067C3C 00167B3C 00000000 */  nop
