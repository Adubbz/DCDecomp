.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSeSeqPlayStop__Fiii
/* 5B020 0015AF20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B024 0015AF24 0000BF7F */  sq         $31, 0x0($sp)
/* 5B028 0015AF28 285E8070 */  paddub     $11, $4, $0
/* 5B02C 0015AF2C 2856A070 */  paddub     $10, $5, $0
/* 5B030 0015AF30 1C00A427 */  addiu      $4, $sp, 0x1C
/* 5B034 0015AF34 282E6071 */  paddub     $5, $11, $0
/* 5B038 0015AF38 846B050C */  jal        GetSeSeq__FPiii
/* 5B03C 0015AF3C 00000000 */   nop
/* 5B040 0015AF40 04004014 */  bnez       $2, .L0015AF54
/* 5B044 0015AF44 00000000 */   nop
/* 5B048 0015AF48 28160070 */  paddub     $2, $0, $0
/* 5B04C 0015AF4C 0D000010 */  b          .L0015AF84
/* 5B050 0015AF50 00000000 */   nop
.L0015AF54:
/* 5B054 0015AF54 00004BA4 */  sh         $11, 0x0($2)
/* 5B058 0015AF58 02004AA4 */  sh         $10, 0x2($2)
/* 5B05C 0015AF5C 1C00A38F */  lw         $3, 0x1C($sp)
/* 5B060 0015AF60 05006010 */  beqz       $3, .L0015AF78
/* 5B064 0015AF64 00000000 */   nop
/* 5B068 0015AF68 01000324 */  addiu      $3, $0, 0x1
/* 5B06C 0015AF6C 040043A4 */  sh         $3, 0x4($2)
/* 5B070 0015AF70 02000010 */  b          .L0015AF7C
/* 5B074 0015AF74 00000000 */   nop
.L0015AF78:
/* 5B078 0015AF78 040040A4 */  sh         $0, 0x4($2)
.L0015AF7C:
/* 5B07C 0015AF7C 060046A4 */  sh         $6, 0x6($2)
/* 5B080 0015AF80 01000224 */  addiu      $2, $0, 0x1
.L0015AF84:
/* 5B084 0015AF84 0000BF7B */  lq         $31, 0x0($sp)
/* 5B088 0015AF88 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5B08C 0015AF8C 0800E003 */  jr         $31
/* 5B090 0015AF90 00000000 */   nop
/* 5B094 0015AF94 00000000 */  nop
/* 5B098 0015AF98 00000000 */  nop
/* 5B09C 0015AF9C 00000000 */  nop
