.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LookAt__FP9CFrameVu1P9CFrameVu116_FRAMECONSTRAINT
/* 049CD0 00149BD0 90FFBD27 */  addiu       $29, $29, -0x70
/* 049CD4 00149BD4 2000BF7F */  sq          $31, 0x20($29)
/* 049CD8 00149BD8 1000B17F */  sq          $17, 0x10($29)
/* 049CDC 00149BDC 0000B07F */  sq          $16, 0x0($29)
/* 049CE0 00149BE0 288E8070 */  paddub      $17, $4, $0
/* 049CE4 00149BE4 2886C070 */  paddub      $16, $6, $0
/* 049CE8 00149BE8 2826A070 */  paddub      $4, $5, $0
/* 049CEC 00149BEC 3000A527 */  addiu       $5, $29, 0x30
/* 049CF0 00149BF0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 049CF4 00149BF4 00000000 */   nop
/* 049CF8 00149BF8 28262072 */  paddub      $4, $17, $0
/* 049CFC 00149BFC 6000A527 */  addiu       $5, $29, 0x60
/* 049D00 00149C00 28360072 */  paddub      $6, $16, $0
/* 049D04 00149C04 4426050C */  jal         LookAt__FP9CFrameVu1Pf16_FRAMECONSTRAINT
/* 049D08 00149C08 00000000 */   nop
/* 049D0C 00149C0C 2000BF7B */  lq          $31, 0x20($29)
/* 049D10 00149C10 1000B17B */  lq          $17, 0x10($29)
/* 049D14 00149C14 0000B07B */  lq          $16, 0x0($29)
/* 049D18 00149C18 7000BD27 */  addiu       $29, $29, 0x70
/* 049D1C 00149C1C 0800E003 */  jr          $31
/* 049D20 00149C20 00000000 */   nop
/* 049D24 00149C24 00000000 */  nop
/* 049D28 00149C28 00000000 */  nop
/* 049D2C 00149C2C 00000000 */  nop
