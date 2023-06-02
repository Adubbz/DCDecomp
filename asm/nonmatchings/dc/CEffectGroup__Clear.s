.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Clear__12CEffectGroupFv
/* 64BC0 00164AC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 64BC4 00164AC4 2000BF7F */  sq         $31, 0x20($sp)
/* 64BC8 00164AC8 1000B17F */  sq         $17, 0x10($sp)
/* 64BCC 00164ACC 0000B07F */  sq         $16, 0x0($sp)
/* 64BD0 00164AD0 288E8070 */  paddub     $17, $4, $0
/* 64BD4 00164AD4 28860070 */  paddub     $16, $0, $0
/* 64BD8 00164AD8 07000010 */  b          .L00164AF8
/* 64BDC 00164ADC 00000000 */   nop
.L00164AE0:
/* 64BE0 00164AE0 001A1000 */  sll        $3, $16, 8
/* 64BE4 00164AE4 0000228E */  lw         $2, 0x0($17)
/* 64BE8 00164AE8 21204300 */  addu       $4, $2, $3
/* 64BEC 00164AEC 1C92050C */  jal        Initialize__7CEffectFv
/* 64BF0 00164AF0 00000000 */   nop
/* 64BF4 00164AF4 01001026 */  addiu      $16, $16, 0x1
.L00164AF8:
/* 64BF8 00164AF8 0400238E */  lw         $3, 0x4($17)
/* 64BFC 00164AFC 2A180302 */  slt        $3, $16, $3
/* 64C00 00164B00 F7FF6014 */  bnez       $3, .L00164AE0
/* 64C04 00164B04 00000000 */   nop
/* 64C08 00164B08 2000BF7B */  lq         $31, 0x20($sp)
/* 64C0C 00164B0C 1000B17B */  lq         $17, 0x10($sp)
/* 64C10 00164B10 0000B07B */  lq         $16, 0x0($sp)
/* 64C14 00164B14 3000BD27 */  addiu      $sp, $sp, 0x30
/* 64C18 00164B18 0800E003 */  jr         $31
/* 64C1C 00164B1C 00000000 */   nop
