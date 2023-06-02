.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_USE_ITEM__FP12RS_STACKDATAi
/* 8BEF0 0018BDF0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 8BEF4 0018BDF4 3000BF7F */  sq         $31, 0x30($sp)
/* 8BEF8 0018BDF8 2000B27F */  sq         $18, 0x20($sp)
/* 8BEFC 0018BDFC 1000B17F */  sq         $17, 0x10($sp)
/* 8BF00 0018BE00 0000B07F */  sq         $16, 0x0($sp)
/* 8BF04 0018BE04 28968070 */  paddub     $18, $4, $0
/* 8BF08 0018BE08 288EA070 */  paddub     $17, $5, $0
/* 8BF0C 0018BE0C 0000838C */  lw         $3, 0x0($4)
/* 8BF10 0018BE10 03000224 */  addiu      $2, $0, 0x3
/* 8BF14 0018BE14 04006210 */  beq        $3, $2, .L0018BE28
/* 8BF18 0018BE18 00000000 */   nop
/* 8BF1C 0018BE1C 28160070 */  paddub     $2, $0, $0
/* 8BF20 0018BE20 1F000010 */  b          .L0018BEA0
/* 8BF24 0018BE24 00000000 */   nop
.L0018BE28:
/* 8BF28 0018BE28 0400428E */  lw         $2, 0x4($18)
/* 8BF2C 0018BE2C 309282AF */  sw         $2, -0x6DD0($gp)
/* 8BF30 0018BE30 08005226 */  addiu      $18, $18, 0x8
/* 8BF34 0018BE34 28860070 */  paddub     $16, $0, $0
/* 8BF38 0018BE38 09000010 */  b          .L0018BE60
/* 8BF3C 0018BE3C 00000000 */   nop
.L0018BE40:
/* 8BF40 0018BE40 28264072 */  paddub     $4, $18, $0
/* 8BF44 0018BE44 08009224 */  addiu      $18, $4, 0x8
/* 8BF48 0018BE48 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BF4C 0018BE4C 00000000 */   nop
/* 8BF50 0018BE50 80181000 */  sll        $3, $16, 2
/* 8BF54 0018BE54 21187D00 */  addu       $3, $3, $sp
/* 8BF58 0018BE58 400062AC */  sw         $2, 0x40($3)
/* 8BF5C 0018BE5C 01001026 */  addiu      $16, $16, 0x1
.L0018BE60:
/* 8BF60 0018BE60 FFFF2226 */  addiu      $2, $17, -0x1
/* 8BF64 0018BE64 2A100202 */  slt        $2, $16, $2
/* 8BF68 0018BE68 F5FF4014 */  bnez       $2, .L0018BE40
/* 8BF6C 0018BE6C 00000000 */   nop
/* 8BF70 0018BE70 FFFF0324 */  addiu      $3, $0, -0x1
/* 8BF74 0018BE74 80101000 */  sll        $2, $16, 2
/* 8BF78 0018BE78 21105D00 */  addu       $2, $2, $sp
/* 8BF7C 0018BE7C 400043AC */  sw         $3, 0x40($2)
/* 8BF80 0018BE80 F4CA050C */  jal        EdUseItemInit__Fv
/* 8BF84 0018BE84 00000000 */   nop
/* 8BF88 0018BE88 4000A427 */  addiu      $4, $sp, 0x40
/* 8BF8C 0018BE8C 00CB050C */  jal        EdSetUseItem__FPi
/* 8BF90 0018BE90 00000000 */   nop
/* 8BF94 0018BE94 05000224 */  addiu      $2, $0, 0x5
/* 8BF98 0018BE98 289282AF */  sw         $2, -0x6DD8($gp)
/* 8BF9C 0018BE9C 01000224 */  addiu      $2, $0, 0x1
.L0018BEA0:
/* 8BFA0 0018BEA0 3000BF7B */  lq         $31, 0x30($sp)
/* 8BFA4 0018BEA4 2000B27B */  lq         $18, 0x20($sp)
/* 8BFA8 0018BEA8 1000B17B */  lq         $17, 0x10($sp)
/* 8BFAC 0018BEAC 0000B07B */  lq         $16, 0x0($sp)
/* 8BFB0 0018BEB0 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 8BFB4 0018BEB4 0800E003 */  jr         $31
/* 8BFB8 0018BEB8 00000000 */   nop
/* 8BFBC 0018BEBC 00000000 */  nop
