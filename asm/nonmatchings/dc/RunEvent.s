.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RunEvent__FiP7CCamera
/* 77AF0 001779F0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 77AF4 001779F4 2000BF7F */  sq         $31, 0x20($sp)
/* 77AF8 001779F8 1000B17F */  sq         $17, 0x10($sp)
/* 77AFC 001779FC 0000B07F */  sq         $16, 0x0($sp)
/* 77B00 00177A00 28868070 */  paddub     $16, $4, $0
/* 77B04 00177A04 288EA070 */  paddub     $17, $5, $0
/* 77B08 00177A08 D090828F */  lw         $2, -0x6F30($gp)
/* 77B0C 00177A0C 07004018 */  blez       $2, .L00177A2C
/* 77B10 00177A10 00000000 */   nop
/* 77B14 00177A14 1492828F */  lw         $2, -0x6DEC($gp)
/* 77B18 00177A18 04004014 */  bnez       $2, .L00177A2C
/* 77B1C 00177A1C 00000000 */   nop
/* 77B20 00177A20 28160070 */  paddub     $2, $0, $0
/* 77B24 00177A24 20000010 */  b          .L00177AA8
/* 77B28 00177A28 00000000 */   nop
.L00177A2C:
/* 77B2C 00177A2C 1C002012 */  beqz       $17, .L00177AA0
/* 77B30 00177A30 00000000 */   nop
/* 77B34 00177A34 28262072 */  paddub     $4, $17, $0
/* 77B38 00177A38 3000A527 */  addiu      $5, $sp, 0x30
/* 77B3C 00177A3C 9C91040C */  jal        GetPos__7CCameraFPf
/* 77B40 00177A40 00000000 */   nop
/* 77B44 00177A44 28262072 */  paddub     $4, $17, $0
/* 77B48 00177A48 4000A527 */  addiu      $5, $sp, 0x40
/* 77B4C 00177A4C A891040C */  jal        GetRef__7CCameraFPf
/* 77B50 00177A50 00000000 */   nop
/* 77B54 00177A54 D301023C */  lui        $2, %hi(EventCamera)
/* 77B58 00177A58 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77B5C 00177A5C 3000A527 */  addiu      $5, $sp, 0x30
/* 77B60 00177A60 A490040C */  jal        SetPos__7CCameraFPf
/* 77B64 00177A64 00000000 */   nop
/* 77B68 00177A68 D301023C */  lui        $2, %hi(EventCamera)
/* 77B6C 00177A6C 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77B70 00177A70 4000A527 */  addiu      $5, $sp, 0x40
/* 77B74 00177A74 C490040C */  jal        SetRef__7CCameraFPf
/* 77B78 00177A78 00000000 */   nop
/* 77B7C 00177A7C D301023C */  lui        $2, %hi(EventCamera)
/* 77B80 00177A80 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77B84 00177A84 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 77B88 00177A88 00000000 */   nop
/* 77B8C 00177A8C 00608044 */  mtc1       $0, $f12
/* 77B90 00177A90 D301023C */  lui        $2, %hi(EventCamera)
/* 77B94 00177A94 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77B98 00177A98 9891040C */  jal        SetRoll__7CCameraFf
/* 77B9C 00177A9C 00000000 */   nop
.L00177AA0:
/* 77BA0 00177AA0 D09090AF */  sw         $16, -0x6F30($gp)
/* 77BA4 00177AA4 01000224 */  addiu      $2, $0, 0x1
.L00177AA8:
/* 77BA8 00177AA8 2000BF7B */  lq         $31, 0x20($sp)
/* 77BAC 00177AAC 1000B17B */  lq         $17, 0x10($sp)
/* 77BB0 00177AB0 0000B07B */  lq         $16, 0x0($sp)
/* 77BB4 00177AB4 5000BD27 */  addiu      $sp, $sp, 0x50
/* 77BB8 00177AB8 0800E003 */  jr         $31
/* 77BBC 00177ABC 00000000 */   nop
