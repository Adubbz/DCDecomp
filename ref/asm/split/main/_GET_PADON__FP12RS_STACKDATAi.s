.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_PADON__FP12RS_STACKDATAi
/* 08B980 0018B880 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08B984 0018B884 1000BF7F */  sq          $31, 0x10($29)
/* 08B988 0018B888 0000B07F */  sq          $16, 0x0($29)
/* 08B98C 0018B88C 28868070 */  paddub      $16, $4, $0
/* 08B990 0018B890 0400A01C */  bgtz        $5, .L0018B8A4
/* 08B994 0018B894 00000000 */   nop
/* 08B998 0018B898 28160070 */  paddub      $2, $0, $0
/* 08B99C 0018B89C 0D000010 */  b           .L0018B8D4
/* 08B9A0 0018B8A0 00000000 */   nop
.L0018B8A4:
/* 08B9A4 0018B8A4 CC01023C */  lui         $2, %hi(GamePad)
/* 08B9A8 0018B8A8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 08B9AC 0018B8AC 80AD040C */  jal         GetPadOn__8CGamePadFv
/* 08B9B0 0018B8B0 00000000 */   nop
/* 08B9B4 0018B8B4 28264070 */  paddub      $4, $2, $0
/* 08B9B8 0018B8B8 102E060C */  jal         exch_ok_cancel__Fi
/* 08B9BC 0018B8BC 00000000 */   nop
/* 08B9C0 0018B8C0 28260072 */  paddub      $4, $16, $0
/* 08B9C4 0018B8C4 282E4070 */  paddub      $5, $2, $0
/* 08B9C8 0018B8C8 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08B9CC 0018B8CC 00000000 */   nop
/* 08B9D0 0018B8D0 01000224 */  addiu       $2, $0, 0x1
.L0018B8D4:
/* 08B9D4 0018B8D4 1000BF7B */  lq          $31, 0x10($29)
/* 08B9D8 0018B8D8 0000B07B */  lq          $16, 0x0($29)
/* 08B9DC 0018B8DC 2000BD27 */  addiu       $29, $29, 0x20
/* 08B9E0 0018B8E0 0800E003 */  jr          $31
/* 08B9E4 0018B8E4 00000000 */   nop
/* 08B9E8 0018B8E8 00000000 */  nop
/* 08B9EC 0018B8EC 00000000 */  nop
