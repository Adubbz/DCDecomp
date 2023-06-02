.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitSprite__FP9ED_SPRITE
/* 8A290 0018A190 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8A294 0018A194 1000BF7F */  sq         $31, 0x10($sp)
/* 8A298 0018A198 0000B07F */  sq         $16, 0x0($sp)
/* 8A29C 0018A19C 28868070 */  paddub     $16, $4, $0
/* 8A2A0 0018A1A0 0D000012 */  beqz       $16, .L0018A1D8
/* 8A2A4 0018A1A4 00000000 */   nop
/* 8A2A8 0018A1A8 282E0070 */  paddub     $5, $0, $0
/* 8A2AC 0018A1AC 88000624 */  addiu      $6, $0, 0x88
/* 8A2B0 0018A1B0 5A0D040C */  jal        memset
/* 8A2B4 0018A1B4 00000000 */   nop
/* 8A2B8 0018A1B8 80000324 */  addiu      $3, $0, 0x80
/* 8A2BC 0018A1BC 220003A6 */  sh         $3, 0x22($16)
/* 8A2C0 0018A1C0 200003A6 */  sh         $3, 0x20($16)
/* 8A2C4 0018A1C4 1E0003A6 */  sh         $3, 0x1E($16)
/* 8A2C8 0018A1C8 1C0003A6 */  sh         $3, 0x1C($16)
/* 8A2CC 0018A1CC FFFF0324 */  addiu      $3, $0, -0x1
/* 8A2D0 0018A1D0 120003A6 */  sh         $3, 0x12($16)
/* 8A2D4 0018A1D4 100003A6 */  sh         $3, 0x10($16)
.L0018A1D8:
/* 8A2D8 0018A1D8 1000BF7B */  lq         $31, 0x10($sp)
/* 8A2DC 0018A1DC 0000B07B */  lq         $16, 0x0($sp)
/* 8A2E0 0018A1E0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8A2E4 0018A1E4 0800E003 */  jr         $31
/* 8A2E8 0018A1E8 00000000 */   nop
/* 8A2EC 0018A1EC 00000000 */  nop
