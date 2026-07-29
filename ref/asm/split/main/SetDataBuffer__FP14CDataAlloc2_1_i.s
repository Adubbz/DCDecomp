.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDataBuffer__FP14CDataAlloc2_1_i
/* 025B90 00125A90 D0FFBD27 */  addiu       $29, $29, -0x30
/* 025B94 00125A94 2000BF7F */  sq          $31, 0x20($29)
/* 025B98 00125A98 1000B17F */  sq          $17, 0x10($29)
/* 025B9C 00125A9C 0000B07F */  sq          $16, 0x0($29)
/* 025BA0 00125AA0 288E8070 */  paddub      $17, $4, $0
/* 025BA4 00125AA4 2886A070 */  paddub      $16, $5, $0
/* 025BA8 00125AA8 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025BAC 00125AAC 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025BB0 00125AB0 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025BB4 00125AB4 00000000 */   nop
/* 025BB8 00125AB8 000022AE */  sw          $2, 0x0($17)
/* 025BBC 00125ABC 0C0030AE */  sw          $16, 0xC($17)
/* 025BC0 00125AC0 080020AE */  sw          $0, 0x8($17)
/* 025BC4 00125AC4 2000BF7B */  lq          $31, 0x20($29)
/* 025BC8 00125AC8 1000B17B */  lq          $17, 0x10($29)
/* 025BCC 00125ACC 0000B07B */  lq          $16, 0x0($29)
/* 025BD0 00125AD0 3000BD27 */  addiu       $29, $29, 0x30
/* 025BD4 00125AD4 0800E003 */  jr          $31
/* 025BD8 00125AD8 00000000 */   nop
/* 025BDC 00125ADC 00000000 */  nop
