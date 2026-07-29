.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_CHARA_ROT__FP12RS_STACKDATAi
/* 08E290 0018E190 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08E294 0018E194 1000BF7F */  sq          $31, 0x10($29)
/* 08E298 0018E198 0000B07F */  sq          $16, 0x0($29)
/* 08E29C 0018E19C 28868070 */  paddub      $16, $4, $0
/* 08E2A0 0018E1A0 0300A128 */  slti        $1, $5, 0x3
/* 08E2A4 0018E1A4 04002010 */  beqz        $1, .L0018E1B8
/* 08E2A8 0018E1A8 00000000 */   nop
/* 08E2AC 0018E1AC 28160070 */  paddub      $2, $0, $0
/* 08E2B0 0018E1B0 0D000010 */  b           .L0018E1E8
/* 08E2B4 0018E1B4 00000000 */   nop
.L0018E1B8:
/* 08E2B8 0018E1B8 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08E2BC 0018E1BC 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 08E2C0 0018E1C0 2000A527 */  addiu       $5, $29, 0x20
/* 08E2C4 0018E1C4 A000998C */  lw          $25, 0xA0($4)
/* 08E2C8 0018E1C8 5800398F */  lw          $25, 0x58($25)
/* 08E2CC 0018E1CC 09F82003 */  jalr        $25
/* 08E2D0 0018E1D0 00000000 */   nop
/* 08E2D4 0018E1D4 28260072 */  paddub      $4, $16, $0
/* 08E2D8 0018E1D8 2000A527 */  addiu       $5, $29, 0x20
/* 08E2DC 0018E1DC CC2D060C */  jal         SetRotation__FP12RS_STACKDATAPf
/* 08E2E0 0018E1E0 00000000 */   nop
/* 08E2E4 0018E1E4 01000224 */  addiu       $2, $0, 0x1
.L0018E1E8:
/* 08E2E8 0018E1E8 1000BF7B */  lq          $31, 0x10($29)
/* 08E2EC 0018E1EC 0000B07B */  lq          $16, 0x0($29)
/* 08E2F0 0018E1F0 3000BD27 */  addiu       $29, $29, 0x30
/* 08E2F4 0018E1F4 0800E003 */  jr          $31
/* 08E2F8 0018E1F8 00000000 */   nop
/* 08E2FC 0018E1FC 00000000 */  nop
