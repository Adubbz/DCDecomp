.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GOTO_USE_ITEM__FP12RS_STACKDATAi
/* 08BEF0 0018BDF0 40FFBD27 */  addiu       $29, $29, -0xC0
/* 08BEF4 0018BDF4 3000BF7F */  sq          $31, 0x30($29)
/* 08BEF8 0018BDF8 2000B27F */  sq          $18, 0x20($29)
/* 08BEFC 0018BDFC 1000B17F */  sq          $17, 0x10($29)
/* 08BF00 0018BE00 0000B07F */  sq          $16, 0x0($29)
/* 08BF04 0018BE04 28968070 */  paddub      $18, $4, $0
/* 08BF08 0018BE08 288EA070 */  paddub      $17, $5, $0
/* 08BF0C 0018BE0C 0000838C */  lw          $3, 0x0($4)
/* 08BF10 0018BE10 03000224 */  addiu       $2, $0, 0x3
/* 08BF14 0018BE14 04006210 */  beq         $3, $2, .L0018BE28
/* 08BF18 0018BE18 00000000 */   nop
/* 08BF1C 0018BE1C 28160070 */  paddub      $2, $0, $0
/* 08BF20 0018BE20 1F000010 */  b           .L0018BEA0
/* 08BF24 0018BE24 00000000 */   nop
.L0018BE28:
/* 08BF28 0018BE28 0400428E */  lw          $2, 0x4($18)
/* 08BF2C 0018BE2C 309282AF */  sw          $2, -0x6DD0($28)
/* 08BF30 0018BE30 08005226 */  addiu       $18, $18, 0x8
/* 08BF34 0018BE34 28860070 */  paddub      $16, $0, $0
/* 08BF38 0018BE38 09000010 */  b           .L0018BE60
/* 08BF3C 0018BE3C 00000000 */   nop
.L0018BE40:
/* 08BF40 0018BE40 28264072 */  paddub      $4, $18, $0
/* 08BF44 0018BE44 08009224 */  addiu       $18, $4, 0x8
/* 08BF48 0018BE48 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BF4C 0018BE4C 00000000 */   nop
/* 08BF50 0018BE50 80181000 */  sll         $3, $16, 2
/* 08BF54 0018BE54 21187D00 */  addu        $3, $3, $29
/* 08BF58 0018BE58 400062AC */  sw          $2, 0x40($3)
/* 08BF5C 0018BE5C 01001026 */  addiu       $16, $16, 0x1
.L0018BE60:
/* 08BF60 0018BE60 FFFF2226 */  addiu       $2, $17, -0x1
/* 08BF64 0018BE64 2A100202 */  slt         $2, $16, $2
/* 08BF68 0018BE68 F5FF4014 */  bnez        $2, .L0018BE40
/* 08BF6C 0018BE6C 00000000 */   nop
/* 08BF70 0018BE70 FFFF0324 */  addiu       $3, $0, -0x1
/* 08BF74 0018BE74 80101000 */  sll         $2, $16, 2
/* 08BF78 0018BE78 21105D00 */  addu        $2, $2, $29
/* 08BF7C 0018BE7C 400043AC */  sw          $3, 0x40($2)
/* 08BF80 0018BE80 F4CA050C */  jal         EdUseItemInit__Fv
/* 08BF84 0018BE84 00000000 */   nop
/* 08BF88 0018BE88 4000A427 */  addiu       $4, $29, 0x40
/* 08BF8C 0018BE8C 00CB050C */  jal         EdSetUseItem__FPi
/* 08BF90 0018BE90 00000000 */   nop
/* 08BF94 0018BE94 05000224 */  addiu       $2, $0, 0x5
/* 08BF98 0018BE98 289282AF */  sw          $2, -0x6DD8($28)
/* 08BF9C 0018BE9C 01000224 */  addiu       $2, $0, 0x1
.L0018BEA0:
/* 08BFA0 0018BEA0 3000BF7B */  lq          $31, 0x30($29)
/* 08BFA4 0018BEA4 2000B27B */  lq          $18, 0x20($29)
/* 08BFA8 0018BEA8 1000B17B */  lq          $17, 0x10($29)
/* 08BFAC 0018BEAC 0000B07B */  lq          $16, 0x0($29)
/* 08BFB0 0018BEB0 C000BD27 */  addiu       $29, $29, 0xC0
/* 08BFB4 0018BEB4 0800E003 */  jr          $31
/* 08BFB8 0018BEB8 00000000 */   nop
/* 08BFBC 0018BEBC 00000000 */  nop
