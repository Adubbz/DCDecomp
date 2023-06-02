.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTextureInfo__FP8CTexturePcPUc
/* 34B90 00134A90 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 34B94 00134A94 5000BF7F */  sq         $31, 0x50($sp)
/* 34B98 00134A98 4000B47F */  sq         $20, 0x40($sp)
/* 34B9C 00134A9C 3000B37F */  sq         $19, 0x30($sp)
/* 34BA0 00134AA0 2000B27F */  sq         $18, 0x20($sp)
/* 34BA4 00134AA4 1000B17F */  sq         $17, 0x10($sp)
/* 34BA8 00134AA8 0000B07F */  sq         $16, 0x0($sp)
/* 34BAC 00134AAC 28A68070 */  paddub     $20, $4, $0
/* 34BB0 00134AB0 289EA070 */  paddub     $19, $5, $0
/* 34BB4 00134AB4 288EC070 */  paddub     $17, $6, $0
/* 34BB8 00134AB8 10003226 */  addiu      $18, $17, 0x10
/* 34BBC 00134ABC 28860070 */  paddub     $16, $0, $0
/* 34BC0 00134AC0 14000010 */  b          .L00134B14
/* 34BC4 00134AC4 00000000 */   nop
.L00134AC8:
/* 34BC8 00134AC8 0A006012 */  beqz       $19, .L00134AF4
/* 34BCC 00134ACC 00000000 */   nop
/* 34BD0 00134AD0 00006282 */  lb         $2, 0x0($19)
/* 34BD4 00134AD4 07004010 */  beqz       $2, .L00134AF4
/* 34BD8 00134AD8 00000000 */   nop
/* 34BDC 00134ADC 28264072 */  paddub     $4, $18, $0
/* 34BE0 00134AE0 282E6072 */  paddub     $5, $19, $0
/* 34BE4 00134AE4 0815040C */  jal        strcmp
/* 34BE8 00134AE8 00000000 */   nop
/* 34BEC 00134AEC 07004014 */  bnez       $2, .L00134B0C
/* 34BF0 00134AF0 00000000 */   nop
.L00134AF4:
/* 34BF4 00134AF4 2000428E */  lw         $2, 0x20($18)
/* 34BF8 00134AF8 21302202 */  addu       $6, $17, $2
/* 34BFC 00134AFC 28268072 */  paddub     $4, $20, $0
/* 34C00 00134B00 282E4072 */  paddub     $5, $18, $0
/* 34C04 00134B04 D8D1040C */  jal        SetTextureInfo__FP8CTexturePcP8TM2_head
/* 34C08 00134B08 00000000 */   nop
.L00134B0C:
/* 34C0C 00134B0C 01001026 */  addiu      $16, $16, 0x1
/* 34C10 00134B10 30005226 */  addiu      $18, $18, 0x30
.L00134B14:
/* 34C14 00134B14 0400238E */  lw         $3, 0x4($17)
/* 34C18 00134B18 2B180302 */  sltu       $3, $16, $3
/* 34C1C 00134B1C EAFF6014 */  bnez       $3, .L00134AC8
/* 34C20 00134B20 00000000 */   nop
/* 34C24 00134B24 5000BF7B */  lq         $31, 0x50($sp)
/* 34C28 00134B28 4000B47B */  lq         $20, 0x40($sp)
/* 34C2C 00134B2C 3000B37B */  lq         $19, 0x30($sp)
/* 34C30 00134B30 2000B27B */  lq         $18, 0x20($sp)
/* 34C34 00134B34 1000B17B */  lq         $17, 0x10($sp)
/* 34C38 00134B38 0000B07B */  lq         $16, 0x0($sp)
/* 34C3C 00134B3C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 34C40 00134B40 0800E003 */  jr         $31
/* 34C44 00134B44 00000000 */   nop
/* 34C48 00134B48 00000000 */  nop
/* 34C4C 00134B4C 00000000 */  nop
