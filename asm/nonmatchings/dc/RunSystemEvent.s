.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RunSystemEvent__FiP7CCamera
/* 77BC0 00177AC0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 77BC4 00177AC4 2000BF7F */  sq         $31, 0x20($sp)
/* 77BC8 00177AC8 1000B17F */  sq         $17, 0x10($sp)
/* 77BCC 00177ACC 0000B07F */  sq         $16, 0x0($sp)
/* 77BD0 00177AD0 28868070 */  paddub     $16, $4, $0
/* 77BD4 00177AD4 288EA070 */  paddub     $17, $5, $0
/* 77BD8 00177AD8 FFFF0324 */  addiu      $3, $0, -0x1
/* 77BDC 00177ADC D09083AF */  sw         $3, -0x6F30($gp)
/* 77BE0 00177AE0 D490838F */  lw         $3, -0x6F2C($gp)
/* 77BE4 00177AE4 1A00601C */  bgtz       $3, .L00177B50
/* 77BE8 00177AE8 00000000 */   nop
/* 77BEC 00177AEC 17002012 */  beqz       $17, .L00177B4C
/* 77BF0 00177AF0 00000000 */   nop
/* 77BF4 00177AF4 28262072 */  paddub     $4, $17, $0
/* 77BF8 00177AF8 3000A527 */  addiu      $5, $sp, 0x30
/* 77BFC 00177AFC 9C91040C */  jal        GetPos__7CCameraFPf
/* 77C00 00177B00 00000000 */   nop
/* 77C04 00177B04 28262072 */  paddub     $4, $17, $0
/* 77C08 00177B08 4000A527 */  addiu      $5, $sp, 0x40
/* 77C0C 00177B0C A891040C */  jal        GetRef__7CCameraFPf
/* 77C10 00177B10 00000000 */   nop
/* 77C14 00177B14 D301023C */  lui        $2, %hi(EventCamera)
/* 77C18 00177B18 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77C1C 00177B1C 3000A527 */  addiu      $5, $sp, 0x30
/* 77C20 00177B20 A490040C */  jal        SetPos__7CCameraFPf
/* 77C24 00177B24 00000000 */   nop
/* 77C28 00177B28 D301023C */  lui        $2, %hi(EventCamera)
/* 77C2C 00177B2C 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77C30 00177B30 4000A527 */  addiu      $5, $sp, 0x40
/* 77C34 00177B34 C490040C */  jal        SetRef__7CCameraFPf
/* 77C38 00177B38 00000000 */   nop
/* 77C3C 00177B3C D301023C */  lui        $2, %hi(EventCamera)
/* 77C40 00177B40 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 77C44 00177B44 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 77C48 00177B48 00000000 */   nop
.L00177B4C:
/* 77C4C 00177B4C D49090AF */  sw         $16, -0x6F2C($gp)
.L00177B50:
/* 77C50 00177B50 2000BF7B */  lq         $31, 0x20($sp)
/* 77C54 00177B54 1000B17B */  lq         $17, 0x10($sp)
/* 77C58 00177B58 0000B07B */  lq         $16, 0x0($sp)
/* 77C5C 00177B5C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 77C60 00177B60 0800E003 */  jr         $31
/* 77C64 00177B64 00000000 */   nop
/* 77C68 00177B68 00000000 */  nop
/* 77C6C 00177B6C 00000000 */  nop
