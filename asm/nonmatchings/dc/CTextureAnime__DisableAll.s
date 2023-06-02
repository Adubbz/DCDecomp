.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableAll__13CTextureAnimeFv
/* 67BE0 00167AE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 67BE4 00167AE4 2000BF7F */  sq         $31, 0x20($sp)
/* 67BE8 00167AE8 1000B17F */  sq         $17, 0x10($sp)
/* 67BEC 00167AEC 0000B07F */  sq         $16, 0x0($sp)
/* 67BF0 00167AF0 288E8070 */  paddub     $17, $4, $0
/* 67BF4 00167AF4 28860070 */  paddub     $16, $0, $0
/* 67BF8 00167AF8 06000010 */  b          .L00167B14
/* 67BFC 00167AFC 00000000 */   nop
.L00167B00:
/* 67C00 00167B00 28262072 */  paddub     $4, $17, $0
/* 67C04 00167B04 282E0072 */  paddub     $5, $16, $0
/* 67C08 00167B08 E09E050C */  jal        Disable__13CTextureAnimeFi
/* 67C0C 00167B0C 00000000 */   nop
/* 67C10 00167B10 01001026 */  addiu      $16, $16, 0x1
.L00167B14:
/* 67C14 00167B14 1800032A */  slti       $3, $16, 0x18
/* 67C18 00167B18 F9FF6014 */  bnez       $3, .L00167B00
/* 67C1C 00167B1C 00000000 */   nop
/* 67C20 00167B20 2000BF7B */  lq         $31, 0x20($sp)
/* 67C24 00167B24 1000B17B */  lq         $17, 0x10($sp)
/* 67C28 00167B28 0000B07B */  lq         $16, 0x0($sp)
/* 67C2C 00167B2C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 67C30 00167B30 0800E003 */  jr         $31
/* 67C34 00167B34 00000000 */   nop
/* 67C38 00167B38 00000000 */  nop
/* 67C3C 00167B3C 00000000 */  nop
