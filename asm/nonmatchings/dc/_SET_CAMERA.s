.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_CAMERA__FP12RS_STACKDATAi
/* 91B50 00191A50 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 91B54 00191A54 3000BF7F */  sq         $31, 0x30($sp)
/* 91B58 00191A58 2000B17F */  sq         $17, 0x20($sp)
/* 91B5C 00191A5C 1000B07F */  sq         $16, 0x10($sp)
/* 91B60 00191A60 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 91B64 00191A64 288E8070 */  paddub     $17, $4, $0
/* 91B68 00191A68 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91B6C 00191A6C 10D2308C */  lw         $16, -0x2DF0($at)
/* 91B70 00191A70 04000016 */  bnez       $16, .L00191A84
/* 91B74 00191A74 00000000 */   nop
/* 91B78 00191A78 28160070 */  paddub     $2, $0, $0
/* 91B7C 00191A7C 39000010 */  b          .L00191B64
/* 91B80 00191A80 00000000 */   nop
.L00191A84:
/* 91B84 00191A84 4000A527 */  addiu      $5, $sp, 0x40
/* 91B88 00191A88 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 91B8C 00191A8C 00000000 */   nop
/* 91B90 00191A90 18002426 */  addiu      $4, $17, 0x18
/* 91B94 00191A94 5000A527 */  addiu      $5, $sp, 0x50
/* 91B98 00191A98 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 91B9C 00191A9C 00000000 */   nop
/* 91BA0 00191AA0 30003126 */  addiu      $17, $17, 0x30
/* 91BA4 00191AA4 28262072 */  paddub     $4, $17, $0
/* 91BA8 00191AA8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 91BAC 00191AAC 00000000 */   nop
/* 91BB0 00191AB0 06050046 */  mov.s      $f20, $f0
/* 91BB4 00191AB4 489280AF */  sw         $0, -0x6DB8($gp)
/* 91BB8 00191AB8 28260072 */  paddub     $4, $16, $0
/* 91BBC 00191ABC C492040C */  jal        FollowOff__13CCameraFollowFv
/* 91BC0 00191AC0 00000000 */   nop
/* 91BC4 00191AC4 28260072 */  paddub     $4, $16, $0
/* 91BC8 00191AC8 282E0070 */  paddub     $5, $0, $0
/* 91BCC 00191ACC 4000ACC7 */  lwc1       $f12, 0x40($sp)
/* 91BD0 00191AD0 4400ADC7 */  lwc1       $f13, 0x44($sp)
/* 91BD4 00191AD4 4800AEC7 */  lwc1       $f14, 0x48($sp)
/* 91BD8 00191AD8 B490040C */  jal        SetNextPos__7CCameraFP6CFramefff
/* 91BDC 00191ADC 00000000 */   nop
/* 91BE0 00191AE0 28260072 */  paddub     $4, $16, $0
/* 91BE4 00191AE4 282E0070 */  paddub     $5, $0, $0
/* 91BE8 00191AE8 5000ACC7 */  lwc1       $f12, 0x50($sp)
/* 91BEC 00191AEC 5400ADC7 */  lwc1       $f13, 0x54($sp)
/* 91BF0 00191AF0 5800AEC7 */  lwc1       $f14, 0x58($sp)
/* 91BF4 00191AF4 E090040C */  jal        SetNextRef__7CCameraFP6CFramefff
/* 91BF8 00191AF8 00000000 */   nop
/* 91BFC 00191AFC 28260072 */  paddub     $4, $16, $0
/* 91C00 00191B00 06A30046 */  mov.s      $f12, $f20
/* 91C04 00191B04 9491040C */  jal        SetSpeed__7CCameraFf
/* 91C08 00191B08 00000000 */   nop
/* 91C0C 00191B0C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 91C10 00191B10 00008244 */  mtc1       $2, $f0
/* 91C14 00191B14 00000000 */  nop
/* 91C18 00191B18 36A00046 */  c.le.s     $f20, $f0
/* 91C1C 00191B1C 00000000 */  nop
/* 91C20 00191B20 0F000045 */  bc1f       .L00191B60
/* 91C24 00191B24 00000000 */   nop
/* 91C28 00191B28 28260072 */  paddub     $4, $16, $0
/* 91C2C 00191B2C 4000A527 */  addiu      $5, $sp, 0x40
/* 91C30 00191B30 A490040C */  jal        SetPos__7CCameraFPf
/* 91C34 00191B34 00000000 */   nop
/* 91C38 00191B38 28260072 */  paddub     $4, $16, $0
/* 91C3C 00191B3C 5000A527 */  addiu      $5, $sp, 0x50
/* 91C40 00191B40 C490040C */  jal        SetRef__7CCameraFPf
/* 91C44 00191B44 00000000 */   nop
/* 91C48 00191B48 28260072 */  paddub     $4, $16, $0
/* 91C4C 00191B4C FFFF0524 */  addiu      $5, $0, -0x1
/* 91C50 00191B50 B802198E */  lw         $25, 0x2B8($16)
/* 91C54 00191B54 0800398F */  lw         $25, 0x8($25)
/* 91C58 00191B58 09F82003 */  jalr       $25
/* 91C5C 00191B5C 00000000 */   nop
.L00191B60:
/* 91C60 00191B60 01000224 */  addiu      $2, $0, 0x1
.L00191B64:
/* 91C64 00191B64 3000BF7B */  lq         $31, 0x30($sp)
/* 91C68 00191B68 2000B17B */  lq         $17, 0x20($sp)
/* 91C6C 00191B6C 1000B07B */  lq         $16, 0x10($sp)
/* 91C70 00191B70 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 91C74 00191B74 6000BD27 */  addiu      $sp, $sp, 0x60
/* 91C78 00191B78 0800E003 */  jr         $31
/* 91C7C 00191B7C 00000000 */   nop
