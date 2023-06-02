.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DmySync__17CMemoryCardAccessFv
/* 116CF0 00216BF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 116CF4 00216BF4 0000BF7F */  sq         $31, 0x0($sp)
/* 116CF8 00216BF8 281E0070 */  paddub     $3, $0, $0
/* 116CFC 00216BFC 07000010 */  b          .L00216C1C
/* 116D00 00216C00 00000000 */   nop
.L00216C04:
/* 116D04 00216C04 28260070 */  paddub     $4, $0, $0
/* 116D08 00216C08 1800A527 */  addiu      $5, $sp, 0x18
/* 116D0C 00216C0C 1C00A627 */  addiu      $6, $sp, 0x1C
/* 116D10 00216C10 C079040C */  jal        sceMcSync
/* 116D14 00216C14 00000000 */   nop
/* 116D18 00216C18 281E4070 */  paddub     $3, $2, $0
.L00216C1C:
/* 116D1C 00216C1C F9FF6010 */  beqz       $3, .L00216C04
/* 116D20 00216C20 00000000 */   nop
/* 116D24 00216C24 0000BF7B */  lq         $31, 0x0($sp)
/* 116D28 00216C28 2000BD27 */  addiu      $sp, $sp, 0x20
/* 116D2C 00216C2C 0800E003 */  jr         $31
/* 116D30 00216C30 00000000 */   nop
/* 116D34 00216C34 00000000 */  nop
/* 116D38 00216C38 00000000 */  nop
/* 116D3C 00216C3C 00000000 */  nop
