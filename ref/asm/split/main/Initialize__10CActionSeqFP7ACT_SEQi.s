.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__10CActionSeqFP7ACT_SEQi
/* 054C30 00154B30 C0FFBD27 */  addiu       $29, $29, -0x40
/* 054C34 00154B34 3000BF7F */  sq          $31, 0x30($29)
/* 054C38 00154B38 2000B27F */  sq          $18, 0x20($29)
/* 054C3C 00154B3C 1000B17F */  sq          $17, 0x10($29)
/* 054C40 00154B40 0000B07F */  sq          $16, 0x0($29)
/* 054C44 00154B44 28968070 */  paddub      $18, $4, $0
/* 054C48 00154B48 288EA070 */  paddub      $17, $5, $0
/* 054C4C 00154B4C 2886C070 */  paddub      $16, $6, $0
/* 054C50 00154B50 F052050C */  jal         ClearSeq__10CActionSeqFv
/* 054C54 00154B54 00000000 */   nop
/* 054C58 00154B58 C80051AE */  sw          $17, 0xC8($18)
/* 054C5C 00154B5C C40050AE */  sw          $16, 0xC4($18)
/* 054C60 00154B60 3000BF7B */  lq          $31, 0x30($29)
/* 054C64 00154B64 2000B27B */  lq          $18, 0x20($29)
/* 054C68 00154B68 1000B17B */  lq          $17, 0x10($29)
/* 054C6C 00154B6C 0000B07B */  lq          $16, 0x0($29)
/* 054C70 00154B70 4000BD27 */  addiu       $29, $29, 0x40
/* 054C74 00154B74 0800E003 */  jr          $31
/* 054C78 00154B78 00000000 */   nop
/* 054C7C 00154B7C 00000000 */  nop
