.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RunEvent__FiP7CCamera
/* 077AF0 001779F0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 077AF4 001779F4 2000BF7F */  sq          $31, 0x20($29)
/* 077AF8 001779F8 1000B17F */  sq          $17, 0x10($29)
/* 077AFC 001779FC 0000B07F */  sq          $16, 0x0($29)
/* 077B00 00177A00 28868070 */  paddub      $16, $4, $0
/* 077B04 00177A04 288EA070 */  paddub      $17, $5, $0
/* 077B08 00177A08 D090828F */  lw          $2, -0x6F30($28)
/* 077B0C 00177A0C 07004018 */  blez        $2, .L00177A2C
/* 077B10 00177A10 00000000 */   nop
/* 077B14 00177A14 1492828F */  lw          $2, -0x6DEC($28)
/* 077B18 00177A18 04004014 */  bnez        $2, .L00177A2C
/* 077B1C 00177A1C 00000000 */   nop
/* 077B20 00177A20 28160070 */  paddub      $2, $0, $0
/* 077B24 00177A24 20000010 */  b           .L00177AA8
/* 077B28 00177A28 00000000 */   nop
.L00177A2C:
/* 077B2C 00177A2C 1C002012 */  beqz        $17, .L00177AA0
/* 077B30 00177A30 00000000 */   nop
/* 077B34 00177A34 28262072 */  paddub      $4, $17, $0
/* 077B38 00177A38 3000A527 */  addiu       $5, $29, 0x30
/* 077B3C 00177A3C 9C91040C */  jal         GetPos__7CCameraFPf
/* 077B40 00177A40 00000000 */   nop
/* 077B44 00177A44 28262072 */  paddub      $4, $17, $0
/* 077B48 00177A48 4000A527 */  addiu       $5, $29, 0x40
/* 077B4C 00177A4C A891040C */  jal         GetRef__7CCameraFPf
/* 077B50 00177A50 00000000 */   nop
/* 077B54 00177A54 D301023C */  lui         $2, %hi(EventCamera)
/* 077B58 00177A58 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 077B5C 00177A5C 3000A527 */  addiu       $5, $29, 0x30
/* 077B60 00177A60 A490040C */  jal         SetPos__7CCameraFPf
/* 077B64 00177A64 00000000 */   nop
/* 077B68 00177A68 D301023C */  lui         $2, %hi(EventCamera)
/* 077B6C 00177A6C 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 077B70 00177A70 4000A527 */  addiu       $5, $29, 0x40
/* 077B74 00177A74 C490040C */  jal         SetRef__7CCameraFPf
/* 077B78 00177A78 00000000 */   nop
/* 077B7C 00177A7C D301023C */  lui         $2, %hi(EventCamera)
/* 077B80 00177A80 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 077B84 00177A84 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 077B88 00177A88 00000000 */   nop
/* 077B8C 00177A8C 00608044 */  mtc1        $0, $f12
/* 077B90 00177A90 D301023C */  lui         $2, %hi(EventCamera)
/* 077B94 00177A94 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 077B98 00177A98 9891040C */  jal         SetRoll__7CCameraFf
/* 077B9C 00177A9C 00000000 */   nop
.L00177AA0:
/* 077BA0 00177AA0 D09090AF */  sw          $16, -0x6F30($28)
/* 077BA4 00177AA4 01000224 */  addiu       $2, $0, 0x1
.L00177AA8:
/* 077BA8 00177AA8 2000BF7B */  lq          $31, 0x20($29)
/* 077BAC 00177AAC 1000B17B */  lq          $17, 0x10($29)
/* 077BB0 00177AB0 0000B07B */  lq          $16, 0x0($29)
/* 077BB4 00177AB4 5000BD27 */  addiu       $29, $29, 0x50
/* 077BB8 00177AB8 0800E003 */  jr          $31
/* 077BBC 00177ABC 00000000 */   nop
