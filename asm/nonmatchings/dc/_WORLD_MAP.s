.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _WORLD_MAP__FP12RS_STACKDATAi
/* 8C000 0018BF00 0000838C */  lw         $3, 0x0($4)
/* 8C004 0018BF04 03000224 */  addiu      $2, $0, 0x3
/* 8C008 0018BF08 04006210 */  beq        $3, $2, .L0018BF1C
/* 8C00C 0018BF0C 00000000 */   nop
/* 8C010 0018BF10 28160070 */  paddub     $2, $0, $0
/* 8C014 0018BF14 06000010 */  b          .L0018BF30
/* 8C018 0018BF18 00000000 */   nop
.L0018BF1C:
/* 8C01C 0018BF1C 0400828C */  lw         $2, 0x4($4)
/* 8C020 0018BF20 349282AF */  sw         $2, -0x6DCC($gp)
/* 8C024 0018BF24 07000224 */  addiu      $2, $0, 0x7
/* 8C028 0018BF28 289282AF */  sw         $2, -0x6DD8($gp)
/* 8C02C 0018BF2C 01000224 */  addiu      $2, $0, 0x1
.L0018BF30:
/* 8C030 0018BF30 0800E003 */  jr         $31
/* 8C034 0018BF34 00000000 */   nop
/* 8C038 0018BF38 00000000 */  nop
/* 8C03C 0018BF3C 00000000 */  nop
