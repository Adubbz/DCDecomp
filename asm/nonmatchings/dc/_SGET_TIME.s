.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_TIME__FP12RS_STACKDATAi
/* 95BD0 00195AD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95BD4 00195AD4 1000BF7F */  sq         $31, 0x10($sp)
/* 95BD8 00195AD8 0000B07F */  sq         $16, 0x0($sp)
/* 95BDC 00195ADC 28868070 */  paddub     $16, $4, $0
/* 95BE0 00195AE0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95BE4 00195AE4 F45E050C */  jal        GetNowTime__9CSaveDataFv
/* 95BE8 00195AE8 00000000 */   nop
/* 95BEC 00195AEC 28260072 */  paddub     $4, $16, $0
/* 95BF0 00195AF0 06030046 */  mov.s      $f12, $f0
/* 95BF4 00195AF4 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 95BF8 00195AF8 00000000 */   nop
/* 95BFC 00195AFC 01000224 */  addiu      $2, $0, 0x1
/* 95C00 00195B00 1000BF7B */  lq         $31, 0x10($sp)
/* 95C04 00195B04 0000B07B */  lq         $16, 0x0($sp)
/* 95C08 00195B08 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95C0C 00195B0C 0800E003 */  jr         $31
/* 95C10 00195B10 00000000 */   nop
/* 95C14 00195B14 00000000 */  nop
/* 95C18 00195B18 00000000 */  nop
/* 95C1C 00195B1C 00000000 */  nop
