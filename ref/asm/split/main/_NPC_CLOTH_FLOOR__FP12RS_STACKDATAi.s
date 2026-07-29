.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NPC_CLOTH_FLOOR__FP12RS_STACKDATAi
/* 08F430 0018F330 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08F434 0018F334 2000BF7F */  sq          $31, 0x20($29)
/* 08F438 0018F338 1000B17F */  sq          $17, 0x10($29)
/* 08F43C 0018F33C 0000B07F */  sq          $16, 0x0($29)
/* 08F440 0018F340 08009124 */  addiu       $17, $4, 0x8
/* 08F444 0018F344 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F448 0018F348 00000000 */   nop
/* 08F44C 0018F34C 28264070 */  paddub      $4, $2, $0
/* 08F450 0018F350 842C060C */  jal         GetChara__Fi
/* 08F454 0018F354 00000000 */   nop
/* 08F458 0018F358 28864070 */  paddub      $16, $2, $0
/* 08F45C 0018F35C 04000016 */  bnez        $16, .L0018F370
/* 08F460 0018F360 00000000 */   nop
/* 08F464 0018F364 28160070 */  paddub      $2, $0, $0
/* 08F468 0018F368 0B000010 */  b           .L0018F398
/* 08F46C 0018F36C 00000000 */   nop
.L0018F370:
/* 08F470 0018F370 28262072 */  paddub      $4, $17, $0
/* 08F474 0018F374 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F478 0018F378 00000000 */   nop
/* 08F47C 0018F37C 28260072 */  paddub      $4, $16, $0
/* 08F480 0018F380 282E4070 */  paddub      $5, $2, $0
/* 08F484 0018F384 A000198E */  lw          $25, 0xA0($16)
/* 08F488 0018F388 9800398F */  lw          $25, 0x98($25)
/* 08F48C 0018F38C 09F82003 */  jalr        $25
/* 08F490 0018F390 00000000 */   nop
/* 08F494 0018F394 01000224 */  addiu       $2, $0, 0x1
.L0018F398:
/* 08F498 0018F398 2000BF7B */  lq          $31, 0x20($29)
/* 08F49C 0018F39C 1000B17B */  lq          $17, 0x10($29)
/* 08F4A0 0018F3A0 0000B07B */  lq          $16, 0x0($29)
/* 08F4A4 0018F3A4 3000BD27 */  addiu       $29, $29, 0x30
/* 08F4A8 0018F3A8 0800E003 */  jr          $31
/* 08F4AC 0018F3AC 00000000 */   nop
