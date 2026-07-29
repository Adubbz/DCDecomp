.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawSellTicket_2__Fiiiii
/* 0ECB30 001ECA30 80FFBD27 */  addiu       $29, $29, -0x80
/* 0ECB34 001ECA34 7000BF7F */  sq          $31, 0x70($29)
/* 0ECB38 001ECA38 6000B67F */  sq          $22, 0x60($29)
/* 0ECB3C 001ECA3C 5000B57F */  sq          $21, 0x50($29)
/* 0ECB40 001ECA40 4000B47F */  sq          $20, 0x40($29)
/* 0ECB44 001ECA44 3000B37F */  sq          $19, 0x30($29)
/* 0ECB48 001ECA48 2000B27F */  sq          $18, 0x20($29)
/* 0ECB4C 001ECA4C 1000B17F */  sq          $17, 0x10($29)
/* 0ECB50 001ECA50 0000B07F */  sq          $16, 0x0($29)
/* 0ECB54 001ECA54 28B68070 */  paddub      $22, $4, $0
/* 0ECB58 001ECA58 28AEC070 */  paddub      $21, $6, $0
/* 0ECB5C 001ECA5C 28A6E070 */  paddub      $20, $7, $0
/* 0ECB60 001ECA60 289E0071 */  paddub      $19, $8, $0
/* 0ECB64 001ECA64 2886C072 */  paddub      $16, $22, $0
/* 0ECB68 001ECA68 288EA070 */  paddub      $17, $5, $0
/* 0ECB6C 001ECA6C 28960070 */  paddub      $18, $0, $0
/* 0ECB70 001ECA70 42000010 */  b           .L001ECB7C
/* 0ECB74 001ECA74 00000000 */   nop
.L001ECA78:
/* 0ECB78 001ECA78 80201200 */  sll         $4, $18, 2
/* 0ECB7C 001ECA7C 9094838F */  lw          $3, -0x6B70($28)
/* 0ECB80 001ECA80 21186400 */  addu        $3, $3, $4
/* 0ECB84 001ECA84 0000668C */  lw          $6, 0x0($3)
/* 0ECB88 001ECA88 0E00C014 */  bnez        $6, .L001ECAC4
/* 0ECB8C 001ECA8C 00000000 */   nop
/* 0ECB90 001ECA90 28001026 */  addiu       $16, $16, 0x28
/* 0ECB94 001ECA94 05000324 */  addiu       $3, $0, 0x5
/* 0ECB98 001ECA98 1A004302 */  div         $0, $18, $3
/* 0ECB9C 001ECA9C 00000000 */  nop
/* 0ECBA0 001ECAA0 00000000 */  nop
/* 0ECBA4 001ECAA4 10200000 */  mfhi        $4
/* 0ECBA8 001ECAA8 04000324 */  addiu       $3, $0, 0x4
/* 0ECBAC 001ECAAC 32008314 */  bne         $4, $3, .L001ECB78
/* 0ECBB0 001ECAB0 00000000 */   nop
/* 0ECBB4 001ECAB4 2886C072 */  paddub      $16, $22, $0
/* 0ECBB8 001ECAB8 28003126 */  addiu       $17, $17, 0x28
/* 0ECBBC 001ECABC 2E000010 */  b           .L001ECB78
/* 0ECBC0 001ECAC0 00000000 */   nop
.L001ECAC4:
/* 0ECBC4 001ECAC4 01000524 */  addiu       $5, $0, 0x1
/* 0ECBC8 001ECAC8 80191200 */  sll         $3, $18, 6
/* 0ECBCC 001ECACC 23187200 */  subu        $3, $3, $18
/* 0ECBD0 001ECAD0 80200300 */  sll         $4, $3, 2
/* 0ECBD4 001ECAD4 A094838F */  lw          $3, -0x6B60($28)
/* 0ECBD8 001ECAD8 21186400 */  addu        $3, $3, $4
/* 0ECBDC 001ECADC 00006384 */  lh          $3, 0x0($3)
/* 0ECBE0 001ECAE0 51006128 */  slti        $1, $3, 0x51
/* 0ECBE4 001ECAE4 02002010 */  beqz        $1, .L001ECAF0
/* 0ECBE8 001ECAE8 00000000 */   nop
/* 0ECBEC 001ECAEC 282E0070 */  paddub      $5, $0, $0
.L001ECAF0:
/* 0ECBF0 001ECAF0 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0ECBF4 001ECAF4 D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0ECBF8 001ECAF8 06006014 */  bnez        $3, .L001ECB14
/* 0ECBFC 001ECAFC 00000000 */   nop
/* 0ECC00 001ECB00 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0ECC04 001ECB04 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0ECC08 001ECB08 02004316 */  bne         $18, $3, .L001ECB14
/* 0ECC0C 001ECB0C 00000000 */   nop
/* 0ECC10 001ECB10 282E0070 */  paddub      $5, $0, $0
.L001ECB14:
/* 0ECC14 001ECB14 28260070 */  paddub      $4, $0, $0
/* 0ECC18 001ECB18 02000324 */  addiu       $3, $0, 0x2
/* 0ECC1C 001ECB1C 0200C314 */  bne         $6, $3, .L001ECB28
/* 0ECC20 001ECB20 00000000 */   nop
/* 0ECC24 001ECB24 01000424 */  addiu       $4, $0, 0x1
.L001ECB28:
/* 0ECC28 001ECB28 0800A010 */  beqz        $5, .L001ECB4C
/* 0ECC2C 001ECB2C 00000000 */   nop
/* 0ECC30 001ECB30 282E0072 */  paddub      $5, $16, $0
/* 0ECC34 001ECB34 28362072 */  paddub      $6, $17, $0
/* 0ECC38 001ECB38 283EA072 */  paddub      $7, $21, $0
/* 0ECC3C 001ECB3C 28468072 */  paddub      $8, $20, $0
/* 0ECC40 001ECB40 284E6072 */  paddub      $9, $19, $0
/* 0ECC44 001ECB44 1CB2070C */  jal         DrawSmallSellTicket__Fiiiiii
/* 0ECC48 001ECB48 00000000 */   nop
.L001ECB4C:
/* 0ECC4C 001ECB4C 28001026 */  addiu       $16, $16, 0x28
/* 0ECC50 001ECB50 05000324 */  addiu       $3, $0, 0x5
/* 0ECC54 001ECB54 1A004302 */  div         $0, $18, $3
/* 0ECC58 001ECB58 00000000 */  nop
/* 0ECC5C 001ECB5C 00000000 */  nop
/* 0ECC60 001ECB60 10200000 */  mfhi        $4
/* 0ECC64 001ECB64 04000324 */  addiu       $3, $0, 0x4
/* 0ECC68 001ECB68 03008314 */  bne         $4, $3, .L001ECB78
/* 0ECC6C 001ECB6C 00000000 */   nop
/* 0ECC70 001ECB70 2886C072 */  paddub      $16, $22, $0
/* 0ECC74 001ECB74 28003126 */  addiu       $17, $17, 0x28
.L001ECB78:
/* 0ECC78 001ECB78 01005226 */  addiu       $18, $18, 0x1
.L001ECB7C:
/* 0ECC7C 001ECB7C 1E00432A */  slti        $3, $18, 0x1E
/* 0ECC80 001ECB80 BDFF6014 */  bnez        $3, .L001ECA78
/* 0ECC84 001ECB84 00000000 */   nop
/* 0ECC88 001ECB88 7000BF7B */  lq          $31, 0x70($29)
/* 0ECC8C 001ECB8C 6000B67B */  lq          $22, 0x60($29)
/* 0ECC90 001ECB90 5000B57B */  lq          $21, 0x50($29)
/* 0ECC94 001ECB94 4000B47B */  lq          $20, 0x40($29)
/* 0ECC98 001ECB98 3000B37B */  lq          $19, 0x30($29)
/* 0ECC9C 001ECB9C 2000B27B */  lq          $18, 0x20($29)
/* 0ECCA0 001ECBA0 1000B17B */  lq          $17, 0x10($29)
/* 0ECCA4 001ECBA4 0000B07B */  lq          $16, 0x0($29)
/* 0ECCA8 001ECBA8 8000BD27 */  addiu       $29, $29, 0x80
/* 0ECCAC 001ECBAC 0800E003 */  jr          $31
/* 0ECCB0 001ECBB0 00000000 */   nop
/* 0ECCB4 001ECBB4 00000000 */  nop
/* 0ECCB8 001ECBB8 00000000 */  nop
/* 0ECCBC 001ECBBC 00000000 */  nop
