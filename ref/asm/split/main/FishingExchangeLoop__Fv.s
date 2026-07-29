.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingExchangeLoop__Fv
/* 0F2EB0 001F2DB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0F2EB4 001F2DB4 1000BF7F */  sq          $31, 0x10($29)
/* 0F2EB8 001F2DB8 0000B07F */  sq          $16, 0x0($29)
/* 0F2EBC 001F2DBC 20C6070C */  jal         FishingExchangeKey__Fv
/* 0F2EC0 001F2DC0 00000000 */   nop
/* 0F2EC4 001F2DC4 28864070 */  paddub      $16, $2, $0
/* 0F2EC8 001F2DC8 04CB070C */  jal         FishingExchangeDraw__Fv
/* 0F2ECC 001F2DCC 00000000 */   nop
/* 0F2ED0 001F2DD0 06000012 */  beqz        $16, .L001F2DEC
/* 0F2ED4 001F2DD4 00000000 */   nop
/* 0F2ED8 001F2DD8 4CCB070C */  jal         ExitFishingExchange__Fv
/* 0F2EDC 001F2DDC 00000000 */   nop
/* 0F2EE0 001F2DE0 01000224 */  addiu       $2, $0, 0x1
/* 0F2EE4 001F2DE4 02000010 */  b           .L001F2DF0
/* 0F2EE8 001F2DE8 00000000 */   nop
.L001F2DEC:
/* 0F2EEC 001F2DEC 28160070 */  paddub      $2, $0, $0
.L001F2DF0:
/* 0F2EF0 001F2DF0 1000BF7B */  lq          $31, 0x10($29)
/* 0F2EF4 001F2DF4 0000B07B */  lq          $16, 0x0($29)
/* 0F2EF8 001F2DF8 2000BD27 */  addiu       $29, $29, 0x20
/* 0F2EFC 001F2DFC 0800E003 */  jr          $31
/* 0F2F00 001F2E00 00000000 */   nop
/* 0F2F04 001F2E04 00000000 */  nop
/* 0F2F08 001F2E08 00000000 */  nop
/* 0F2F0C 001F2E0C 00000000 */  nop
