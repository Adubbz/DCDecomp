.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EnterEffect__12CEffectGroupFP12CEffectParam
/* 064A80 00164980 F0FFBD27 */  addiu       $29, $29, -0x10
/* 064A84 00164984 0000BF7F */  sq          $31, 0x0($29)
/* 064A88 00164988 28360070 */  paddub      $6, $0, $0
/* 064A8C 0016498C 0E000010 */  b           .L001649C8
/* 064A90 00164990 00000000 */   nop
.L00164994:
/* 064A94 00164994 001A0600 */  sll         $3, $6, 8
/* 064A98 00164998 0000828C */  lw          $2, 0x0($4)
/* 064A9C 0016499C 21184300 */  addu        $3, $2, $3
/* 064AA0 001649A0 00006284 */  lh          $2, 0x0($3)
/* 064AA4 001649A4 07004014 */  bnez        $2, .L001649C4
/* 064AA8 001649A8 00000000 */   nop
/* 064AAC 001649AC 28266070 */  paddub      $4, $3, $0
/* 064AB0 001649B0 B88F050C */  jal         SetEffect__7CEffectFP12CEffectParam
/* 064AB4 001649B4 00000000 */   nop
/* 064AB8 001649B8 01000224 */  addiu       $2, $0, 0x1
/* 064ABC 001649BC 07000010 */  b           .L001649DC
/* 064AC0 001649C0 00000000 */   nop
.L001649C4:
/* 064AC4 001649C4 0100C624 */  addiu       $6, $6, 0x1
.L001649C8:
/* 064AC8 001649C8 0400828C */  lw          $2, 0x4($4)
/* 064ACC 001649CC 2A10C200 */  slt         $2, $6, $2
/* 064AD0 001649D0 F0FF4014 */  bnez        $2, .L00164994
/* 064AD4 001649D4 00000000 */   nop
/* 064AD8 001649D8 28160070 */  paddub      $2, $0, $0
.L001649DC:
/* 064ADC 001649DC 0000BF7B */  lq          $31, 0x0($29)
/* 064AE0 001649E0 1000BD27 */  addiu       $29, $29, 0x10
/* 064AE4 001649E4 0800E003 */  jr          $31
/* 064AE8 001649E8 00000000 */   nop
/* 064AEC 001649EC 00000000 */  nop
