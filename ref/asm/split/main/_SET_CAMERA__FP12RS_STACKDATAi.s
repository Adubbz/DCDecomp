.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CAMERA__FP12RS_STACKDATAi
/* 091B50 00191A50 A0FFBD27 */  addiu       $29, $29, -0x60
/* 091B54 00191A54 3000BF7F */  sq          $31, 0x30($29)
/* 091B58 00191A58 2000B17F */  sq          $17, 0x20($29)
/* 091B5C 00191A5C 1000B07F */  sq          $16, 0x10($29)
/* 091B60 00191A60 0000B4E7 */  swc1        $f20, 0x0($29)
/* 091B64 00191A64 288E8070 */  paddub      $17, $4, $0
/* 091B68 00191A68 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 091B6C 00191A6C 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 091B70 00191A70 04000016 */  bnez        $16, .L00191A84
/* 091B74 00191A74 00000000 */   nop
/* 091B78 00191A78 28160070 */  paddub      $2, $0, $0
/* 091B7C 00191A7C 39000010 */  b           .L00191B64
/* 091B80 00191A80 00000000 */   nop
.L00191A84:
/* 091B84 00191A84 4000A527 */  addiu       $5, $29, 0x40
/* 091B88 00191A88 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 091B8C 00191A8C 00000000 */   nop
/* 091B90 00191A90 18002426 */  addiu       $4, $17, 0x18
/* 091B94 00191A94 5000A527 */  addiu       $5, $29, 0x50
/* 091B98 00191A98 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 091B9C 00191A9C 00000000 */   nop
/* 091BA0 00191AA0 30003126 */  addiu       $17, $17, 0x30
/* 091BA4 00191AA4 28262072 */  paddub      $4, $17, $0
/* 091BA8 00191AA8 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 091BAC 00191AAC 00000000 */   nop
/* 091BB0 00191AB0 06050046 */  mov.s       $f20, $f0
/* 091BB4 00191AB4 489280AF */  sw          $0, -0x6DB8($28)
/* 091BB8 00191AB8 28260072 */  paddub      $4, $16, $0
/* 091BBC 00191ABC C492040C */  jal         FollowOff__13CCameraFollowFv
/* 091BC0 00191AC0 00000000 */   nop
/* 091BC4 00191AC4 28260072 */  paddub      $4, $16, $0
/* 091BC8 00191AC8 282E0070 */  paddub      $5, $0, $0
/* 091BCC 00191ACC 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 091BD0 00191AD0 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 091BD4 00191AD4 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 091BD8 00191AD8 B490040C */  jal         SetNextPos__7CCameraFP6CFramefff
/* 091BDC 00191ADC 00000000 */   nop
/* 091BE0 00191AE0 28260072 */  paddub      $4, $16, $0
/* 091BE4 00191AE4 282E0070 */  paddub      $5, $0, $0
/* 091BE8 00191AE8 5000ACC7 */  lwc1        $f12, 0x50($29)
/* 091BEC 00191AEC 5400ADC7 */  lwc1        $f13, 0x54($29)
/* 091BF0 00191AF0 5800AEC7 */  lwc1        $f14, 0x58($29)
/* 091BF4 00191AF4 E090040C */  jal         SetNextRef__7CCameraFP6CFramefff
/* 091BF8 00191AF8 00000000 */   nop
/* 091BFC 00191AFC 28260072 */  paddub      $4, $16, $0
/* 091C00 00191B00 06A30046 */  mov.s       $f12, $f20
/* 091C04 00191B04 9491040C */  jal         SetSpeed__7CCameraFf
/* 091C08 00191B08 00000000 */   nop
/* 091C0C 00191B0C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 091C10 00191B10 00008244 */  mtc1        $2, $f0
/* 091C14 00191B14 00000000 */  nop
/* 091C18 00191B18 36A00046 */  c.le.s      $f20, $f0
/* 091C1C 00191B1C 00000000 */  nop
/* 091C20 00191B20 0F000045 */  bc1f        .L00191B60
/* 091C24 00191B24 00000000 */   nop
/* 091C28 00191B28 28260072 */  paddub      $4, $16, $0
/* 091C2C 00191B2C 4000A527 */  addiu       $5, $29, 0x40
/* 091C30 00191B30 A490040C */  jal         SetPos__7CCameraFPf
/* 091C34 00191B34 00000000 */   nop
/* 091C38 00191B38 28260072 */  paddub      $4, $16, $0
/* 091C3C 00191B3C 5000A527 */  addiu       $5, $29, 0x50
/* 091C40 00191B40 C490040C */  jal         SetRef__7CCameraFPf
/* 091C44 00191B44 00000000 */   nop
/* 091C48 00191B48 28260072 */  paddub      $4, $16, $0
/* 091C4C 00191B4C FFFF0524 */  addiu       $5, $0, -0x1
/* 091C50 00191B50 B802198E */  lw          $25, 0x2B8($16)
/* 091C54 00191B54 0800398F */  lw          $25, 0x8($25)
/* 091C58 00191B58 09F82003 */  jalr        $25
/* 091C5C 00191B5C 00000000 */   nop
.L00191B60:
/* 091C60 00191B60 01000224 */  addiu       $2, $0, 0x1
.L00191B64:
/* 091C64 00191B64 3000BF7B */  lq          $31, 0x30($29)
/* 091C68 00191B68 2000B17B */  lq          $17, 0x20($29)
/* 091C6C 00191B6C 1000B07B */  lq          $16, 0x10($29)
/* 091C70 00191B70 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 091C74 00191B74 6000BD27 */  addiu       $29, $29, 0x60
/* 091C78 00191B78 0800E003 */  jr          $31
/* 091C7C 00191B7C 00000000 */   nop
