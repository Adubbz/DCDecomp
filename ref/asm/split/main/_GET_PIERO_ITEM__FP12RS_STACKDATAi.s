.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_PIERO_ITEM__FP12RS_STACKDATAi
/* 0BD890 001BD790 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BD894 001BD794 1000BF7F */  sq          $31, 0x10($29)
/* 0BD898 001BD798 0000B07F */  sq          $16, 0x0($29)
/* 0BD89C 001BD79C 28868070 */  paddub      $16, $4, $0
/* 0BD8A0 001BD7A0 A49D848F */  lw          $4, -0x625C($28)
/* 0BD8A4 001BD7A4 C49C858F */  lw          $5, -0x633C($28)
/* 0BD8A8 001BD7A8 2800A627 */  addiu       $6, $29, 0x28
/* 0BD8AC 001BD7AC 2C00A727 */  addiu       $7, $29, 0x2C
/* 0BD8B0 001BD7B0 ACFE060C */  jal         GetPieroItem__FiiPiPi
/* 0BD8B4 001BD7B4 00000000 */   nop
/* 0BD8B8 001BD7B8 28260072 */  paddub      $4, $16, $0
/* 0BD8BC 001BD7BC 08009024 */  addiu       $16, $4, 0x8
/* 0BD8C0 001BD7C0 2800A58F */  lw          $5, 0x28($29)
/* 0BD8C4 001BD7C4 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD8C8 001BD7C8 00000000 */   nop
/* 0BD8CC 001BD7CC 28260072 */  paddub      $4, $16, $0
/* 0BD8D0 001BD7D0 2C00A58F */  lw          $5, 0x2C($29)
/* 0BD8D4 001BD7D4 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD8D8 001BD7D8 00000000 */   nop
/* 0BD8DC 001BD7DC 01000224 */  addiu       $2, $0, 0x1
/* 0BD8E0 001BD7E0 1000BF7B */  lq          $31, 0x10($29)
/* 0BD8E4 001BD7E4 0000B07B */  lq          $16, 0x0($29)
/* 0BD8E8 001BD7E8 3000BD27 */  addiu       $29, $29, 0x30
/* 0BD8EC 001BD7EC 0800E003 */  jr          $31
/* 0BD8F0 001BD7F0 00000000 */   nop
/* 0BD8F4 001BD7F4 00000000 */  nop
/* 0BD8F8 001BD7F8 00000000 */  nop
/* 0BD8FC 001BD7FC 00000000 */  nop
