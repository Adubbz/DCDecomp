.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_SHADOW__FP12RS_STACKDATAi
/* 932B0 001931B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 932B4 001931B4 0000BF7F */  sq         $31, 0x0($sp)
/* 932B8 001931B8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 932BC 001931BC 00000000 */   nop
/* 932C0 001931C0 2B100200 */  sltu       $2, $0, $2
/* 932C4 001931C4 01004238 */  xori       $2, $2, 0x1
/* 932C8 001931C8 FF004230 */  andi       $2, $2, 0xFF
/* 932CC 001931CC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 932D0 001931D0 B0D422AC */  sw         $2, -0x2B50($at)
/* 932D4 001931D4 01000224 */  addiu      $2, $0, 0x1
/* 932D8 001931D8 0000BF7B */  lq         $31, 0x0($sp)
/* 932DC 001931DC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 932E0 001931E0 0800E003 */  jr         $31
/* 932E4 001931E4 00000000 */   nop
/* 932E8 001931E8 00000000 */  nop
/* 932EC 001931EC 00000000 */  nop
