.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_EDIT_WATER__FP12RS_STACKDATAi
/* 93380 00193280 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 93384 00193284 0000BF7F */  sq         $31, 0x0($sp)
/* 93388 00193288 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9338C 0019328C 10D4228C */  lw         $2, -0x2BF0($at)
/* 93390 00193290 0B004010 */  beqz       $2, .L001932C0
/* 93394 00193294 00000000 */   nop
/* 93398 00193298 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9339C 0019329C 00000000 */   nop
/* 933A0 001932A0 2B100200 */  sltu       $2, $0, $2
/* 933A4 001932A4 01004238 */  xori       $2, $2, 0x1
/* 933A8 001932A8 FF004330 */  andi       $3, $2, 0xFF
/* 933AC 001932AC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 933B0 001932B0 10D4228C */  lw         $2, -0x2BF0($at)
/* 933B4 001932B4 0200013C */  lui        $at, (0x2095C >> 16)
/* 933B8 001932B8 21084100 */  addu       $at, $2, $at
/* 933BC 001932BC 5C0923AC */  sw         $3, (0x2095C & 0xFFFF)($at)
.L001932C0:
/* 933C0 001932C0 01000224 */  addiu      $2, $0, 0x1
/* 933C4 001932C4 0000BF7B */  lq         $31, 0x0($sp)
/* 933C8 001932C8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 933CC 001932CC 0800E003 */  jr         $31
/* 933D0 001932D0 00000000 */   nop
/* 933D4 001932D4 00000000 */  nop
/* 933D8 001932D8 00000000 */  nop
/* 933DC 001932DC 00000000 */  nop
