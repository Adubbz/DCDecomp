.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__12CEffectGroupFi
/* 64AF0 001649F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 64AF4 001649F4 2000BF7F */  sq         $31, 0x20($sp)
/* 64AF8 001649F8 1000B17F */  sq         $17, 0x10($sp)
/* 64AFC 001649FC 0000B07F */  sq         $16, 0x0($sp)
/* 64B00 00164A00 288E8070 */  paddub     $17, $4, $0
/* 64B04 00164A04 28860070 */  paddub     $16, $0, $0
/* 64B08 00164A08 08000010 */  b          .L00164A2C
/* 64B0C 00164A0C 00000000 */   nop
.L00164A10:
/* 64B10 00164A10 001A1000 */  sll        $3, $16, 8
/* 64B14 00164A14 0000228E */  lw         $2, 0x0($17)
/* 64B18 00164A18 21204300 */  addu       $4, $2, $3
/* 64B1C 00164A1C 01000524 */  addiu      $5, $0, 0x1
/* 64B20 00164A20 3090050C */  jal        Step__7CEffectFi
/* 64B24 00164A24 00000000 */   nop
/* 64B28 00164A28 01001026 */  addiu      $16, $16, 0x1
.L00164A2C:
/* 64B2C 00164A2C 0400238E */  lw         $3, 0x4($17)
/* 64B30 00164A30 2A180302 */  slt        $3, $16, $3
/* 64B34 00164A34 F6FF6014 */  bnez       $3, .L00164A10
/* 64B38 00164A38 00000000 */   nop
/* 64B3C 00164A3C 2000BF7B */  lq         $31, 0x20($sp)
/* 64B40 00164A40 1000B17B */  lq         $17, 0x10($sp)
/* 64B44 00164A44 0000B07B */  lq         $16, 0x0($sp)
/* 64B48 00164A48 3000BD27 */  addiu      $sp, $sp, 0x30
/* 64B4C 00164A4C 0800E003 */  jr         $31
/* 64B50 00164A50 00000000 */   nop
/* 64B54 00164A54 00000000 */  nop
/* 64B58 00164A58 00000000 */  nop
/* 64B5C 00164A5C 00000000 */  nop
