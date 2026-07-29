.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SGET_GAME_INT_FLAG__FP12RS_STACKDATAi
/* 095180 00195080 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095184 00195084 1000BF7F */  sq          $31, 0x10($29)
/* 095188 00195088 0000B07F */  sq          $16, 0x0($29)
/* 09518C 0019508C 02000224 */  addiu       $2, $0, 0x2
/* 095190 00195090 0400A210 */  beq         $5, $2, .L001950A4
/* 095194 00195094 00000000 */   nop
/* 095198 00195098 28160070 */  paddub      $2, $0, $0
/* 09519C 0019509C 0D000010 */  b           .L001950D4
/* 0951A0 001950A0 00000000 */   nop
.L001950A4:
/* 0951A4 001950A4 08009024 */  addiu       $16, $4, 0x8
/* 0951A8 001950A8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0951AC 001950AC 00000000 */   nop
/* 0951B0 001950B0 1C8D848F */  lw          $4, -0x72E4($28)
/* 0951B4 001950B4 282E4070 */  paddub      $5, $2, $0
/* 0951B8 001950B8 C860050C */  jal         GetGameIntFlag__9CSaveDataFi
/* 0951BC 001950BC 00000000 */   nop
/* 0951C0 001950C0 28260072 */  paddub      $4, $16, $0
/* 0951C4 001950C4 282E4070 */  paddub      $5, $2, $0
/* 0951C8 001950C8 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0951CC 001950CC 00000000 */   nop
/* 0951D0 001950D0 01000224 */  addiu       $2, $0, 0x1
.L001950D4:
/* 0951D4 001950D4 1000BF7B */  lq          $31, 0x10($29)
/* 0951D8 001950D8 0000B07B */  lq          $16, 0x0($29)
/* 0951DC 001950DC 2000BD27 */  addiu       $29, $29, 0x20
/* 0951E0 001950E0 0800E003 */  jr          $31
/* 0951E4 001950E4 00000000 */   nop
/* 0951E8 001950E8 00000000 */  nop
/* 0951EC 001950EC 00000000 */  nop
