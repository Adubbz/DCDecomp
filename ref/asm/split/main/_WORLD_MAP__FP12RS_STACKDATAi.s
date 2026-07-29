.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _WORLD_MAP__FP12RS_STACKDATAi
/* 08C000 0018BF00 0000838C */  lw          $3, 0x0($4)
/* 08C004 0018BF04 03000224 */  addiu       $2, $0, 0x3
/* 08C008 0018BF08 04006210 */  beq         $3, $2, .L0018BF1C
/* 08C00C 0018BF0C 00000000 */   nop
/* 08C010 0018BF10 28160070 */  paddub      $2, $0, $0
/* 08C014 0018BF14 06000010 */  b           .L0018BF30
/* 08C018 0018BF18 00000000 */   nop
.L0018BF1C:
/* 08C01C 0018BF1C 0400828C */  lw          $2, 0x4($4)
/* 08C020 0018BF20 349282AF */  sw          $2, -0x6DCC($28)
/* 08C024 0018BF24 07000224 */  addiu       $2, $0, 0x7
/* 08C028 0018BF28 289282AF */  sw          $2, -0x6DD8($28)
/* 08C02C 0018BF2C 01000224 */  addiu       $2, $0, 0x1
.L0018BF30:
/* 08C030 0018BF30 0800E003 */  jr          $31
/* 08C034 0018BF34 00000000 */   nop
/* 08C038 0018BF38 00000000 */  nop
/* 08C03C 0018BF3C 00000000 */  nop
