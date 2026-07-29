.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_NPC_TALK_POS__FP12RS_STACKDATAi
/* 08E360 0018E260 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08E364 0018E264 2000BF7F */  sq          $31, 0x20($29)
/* 08E368 0018E268 1000B17F */  sq          $17, 0x10($29)
/* 08E36C 0018E26C 0000B07F */  sq          $16, 0x0($29)
/* 08E370 0018E270 288EA070 */  paddub      $17, $5, $0
/* 08E374 0018E274 0200212A */  slti        $1, $17, 0x2
/* 08E378 0018E278 04002010 */  beqz        $1, .L0018E28C
/* 08E37C 0018E27C 00000000 */   nop
/* 08E380 0018E280 28160070 */  paddub      $2, $0, $0
/* 08E384 0018E284 2C000010 */  b           .L0018E338
/* 08E388 0018E288 00000000 */   nop
.L0018E28C:
/* 08E38C 0018E28C 08009024 */  addiu       $16, $4, 0x8
/* 08E390 0018E290 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08E394 0018E294 00000000 */   nop
/* 08E398 0018E298 FFFF0324 */  addiu       $3, $0, -0x1
/* 08E39C 0018E29C 07004314 */  bne         $2, $3, .L0018E2BC
/* 08E3A0 0018E2A0 00000000 */   nop
/* 08E3A4 0018E2A4 FFFF2526 */  addiu       $5, $17, -0x1
/* 08E3A8 0018E2A8 28260072 */  paddub      $4, $16, $0
/* 08E3AC 0018E2AC 0838060C */  jal         _GET_CHARA_TALK_POS__FP12RS_STACKDATAi
/* 08E3B0 0018E2B0 00000000 */   nop
/* 08E3B4 0018E2B4 20000010 */  b           .L0018E338
/* 08E3B8 0018E2B8 00000000 */   nop
.L0018E2BC:
/* 08E3BC 0018E2BC 06004004 */  bltz        $2, .L0018E2D8
/* 08E3C0 0018E2C0 00000000 */   nop
/* 08E3C4 0018E2C4 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F8)
/* 08E3C8 0018E2C8 C8D3238C */  lw          $3, %lo(EdEventInfo + 0x1F8)($1)
/* 08E3CC 0018E2CC 2A184300 */  slt         $3, $2, $3
/* 08E3D0 0018E2D0 04006014 */  bnez        $3, .L0018E2E4
/* 08E3D4 0018E2D4 00000000 */   nop
.L0018E2D8:
/* 08E3D8 0018E2D8 28160070 */  paddub      $2, $0, $0
/* 08E3DC 0018E2DC 16000010 */  b           .L0018E338
/* 08E3E0 0018E2E0 00000000 */   nop
.L0018E2E4:
/* 08E3E4 0018E2E4 40190200 */  sll         $3, $2, 5
/* 08E3E8 0018E2E8 21186200 */  addu        $3, $3, $2
/* 08E3EC 0018E2EC 80100300 */  sll         $2, $3, 2
/* 08E3F0 0018E2F0 21106200 */  addu        $2, $3, $2
/* 08E3F4 0018E2F4 40190200 */  sll         $3, $2, 5
/* 08E3F8 0018E2F8 D401013C */  lui         $1, %hi(EdEventInfo + 0x58)
/* 08E3FC 0018E2FC 28D2228C */  lw          $2, %lo(EdEventInfo + 0x58)($1)
/* 08E400 0018E300 21204300 */  addu        $4, $2, $3
/* 08E404 0018E304 3800A527 */  addiu       $5, $29, 0x38
/* 08E408 0018E308 6032050C */  jal         GetScrPosFromChar__FP10CCharacterPi
/* 08E40C 0018E30C 00000000 */   nop
/* 08E410 0018E310 28260072 */  paddub      $4, $16, $0
/* 08E414 0018E314 08009024 */  addiu       $16, $4, 0x8
/* 08E418 0018E318 3800A58F */  lw          $5, 0x38($29)
/* 08E41C 0018E31C F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08E420 0018E320 00000000 */   nop
/* 08E424 0018E324 28260072 */  paddub      $4, $16, $0
/* 08E428 0018E328 3C00A58F */  lw          $5, 0x3C($29)
/* 08E42C 0018E32C F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08E430 0018E330 00000000 */   nop
/* 08E434 0018E334 01000224 */  addiu       $2, $0, 0x1
.L0018E338:
/* 08E438 0018E338 2000BF7B */  lq          $31, 0x20($29)
/* 08E43C 0018E33C 1000B17B */  lq          $17, 0x10($29)
/* 08E440 0018E340 0000B07B */  lq          $16, 0x0($29)
/* 08E444 0018E344 4000BD27 */  addiu       $29, $29, 0x40
/* 08E448 0018E348 0800E003 */  jr          $31
/* 08E44C 0018E34C 00000000 */   nop
