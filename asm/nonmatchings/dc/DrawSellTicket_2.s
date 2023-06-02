.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawSellTicket_2__Fiiiii
/* ECB30 001ECA30 80FFBD27 */  addiu      $sp, $sp, -0x80
/* ECB34 001ECA34 7000BF7F */  sq         $31, 0x70($sp)
/* ECB38 001ECA38 6000B67F */  sq         $22, 0x60($sp)
/* ECB3C 001ECA3C 5000B57F */  sq         $21, 0x50($sp)
/* ECB40 001ECA40 4000B47F */  sq         $20, 0x40($sp)
/* ECB44 001ECA44 3000B37F */  sq         $19, 0x30($sp)
/* ECB48 001ECA48 2000B27F */  sq         $18, 0x20($sp)
/* ECB4C 001ECA4C 1000B17F */  sq         $17, 0x10($sp)
/* ECB50 001ECA50 0000B07F */  sq         $16, 0x0($sp)
/* ECB54 001ECA54 28B68070 */  paddub     $22, $4, $0
/* ECB58 001ECA58 28AEC070 */  paddub     $21, $6, $0
/* ECB5C 001ECA5C 28A6E070 */  paddub     $20, $7, $0
/* ECB60 001ECA60 289E0071 */  paddub     $19, $8, $0
/* ECB64 001ECA64 2886C072 */  paddub     $16, $22, $0
/* ECB68 001ECA68 288EA070 */  paddub     $17, $5, $0
/* ECB6C 001ECA6C 28960070 */  paddub     $18, $0, $0
/* ECB70 001ECA70 42000010 */  b          .L001ECB7C
/* ECB74 001ECA74 00000000 */   nop
.L001ECA78:
/* ECB78 001ECA78 80201200 */  sll        $4, $18, 2
/* ECB7C 001ECA7C 9094838F */  lw         $3, -0x6B70($gp)
/* ECB80 001ECA80 21186400 */  addu       $3, $3, $4
/* ECB84 001ECA84 0000668C */  lw         $6, 0x0($3)
/* ECB88 001ECA88 0E00C014 */  bnez       $6, .L001ECAC4
/* ECB8C 001ECA8C 00000000 */   nop
/* ECB90 001ECA90 28001026 */  addiu      $16, $16, 0x28
/* ECB94 001ECA94 05000324 */  addiu      $3, $0, 0x5
/* ECB98 001ECA98 1A004302 */  div        $0, $18, $3
/* ECB9C 001ECA9C 00000000 */  nop
/* ECBA0 001ECAA0 00000000 */  nop
/* ECBA4 001ECAA4 10200000 */  mfhi       $4
/* ECBA8 001ECAA8 04000324 */  addiu      $3, $0, 0x4
/* ECBAC 001ECAAC 32008314 */  bne        $4, $3, .L001ECB78
/* ECBB0 001ECAB0 00000000 */   nop
/* ECBB4 001ECAB4 2886C072 */  paddub     $16, $22, $0
/* ECBB8 001ECAB8 28003126 */  addiu      $17, $17, 0x28
/* ECBBC 001ECABC 2E000010 */  b          .L001ECB78
/* ECBC0 001ECAC0 00000000 */   nop
.L001ECAC4:
/* ECBC4 001ECAC4 01000524 */  addiu      $5, $0, 0x1
/* ECBC8 001ECAC8 80191200 */  sll        $3, $18, 6
/* ECBCC 001ECACC 23187200 */  subu       $3, $3, $18
/* ECBD0 001ECAD0 80200300 */  sll        $4, $3, 2
/* ECBD4 001ECAD4 A094838F */  lw         $3, -0x6B60($gp)
/* ECBD8 001ECAD8 21186400 */  addu       $3, $3, $4
/* ECBDC 001ECADC 00006384 */  lh         $3, 0x0($3)
/* ECBE0 001ECAE0 51006128 */  slti       $at, $3, 0x51
/* ECBE4 001ECAE4 02002010 */  beqz       $at, .L001ECAF0
/* ECBE8 001ECAE8 00000000 */   nop
/* ECBEC 001ECAEC 282E0070 */  paddub     $5, $0, $0
.L001ECAF0:
/* ECBF0 001ECAF0 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* ECBF4 001ECAF4 D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* ECBF8 001ECAF8 06006014 */  bnez       $3, .L001ECB14
/* ECBFC 001ECAFC 00000000 */   nop
/* ECC00 001ECB00 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* ECC04 001ECB04 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* ECC08 001ECB08 02004316 */  bne        $18, $3, .L001ECB14
/* ECC0C 001ECB0C 00000000 */   nop
/* ECC10 001ECB10 282E0070 */  paddub     $5, $0, $0
.L001ECB14:
/* ECC14 001ECB14 28260070 */  paddub     $4, $0, $0
/* ECC18 001ECB18 02000324 */  addiu      $3, $0, 0x2
/* ECC1C 001ECB1C 0200C314 */  bne        $6, $3, .L001ECB28
/* ECC20 001ECB20 00000000 */   nop
/* ECC24 001ECB24 01000424 */  addiu      $4, $0, 0x1
.L001ECB28:
/* ECC28 001ECB28 0800A010 */  beqz       $5, .L001ECB4C
/* ECC2C 001ECB2C 00000000 */   nop
/* ECC30 001ECB30 282E0072 */  paddub     $5, $16, $0
/* ECC34 001ECB34 28362072 */  paddub     $6, $17, $0
/* ECC38 001ECB38 283EA072 */  paddub     $7, $21, $0
/* ECC3C 001ECB3C 28468072 */  paddub     $8, $20, $0
/* ECC40 001ECB40 284E6072 */  paddub     $9, $19, $0
/* ECC44 001ECB44 1CB2070C */  jal        DrawSmallSellTicket__Fiiiiii
/* ECC48 001ECB48 00000000 */   nop
.L001ECB4C:
/* ECC4C 001ECB4C 28001026 */  addiu      $16, $16, 0x28
/* ECC50 001ECB50 05000324 */  addiu      $3, $0, 0x5
/* ECC54 001ECB54 1A004302 */  div        $0, $18, $3
/* ECC58 001ECB58 00000000 */  nop
/* ECC5C 001ECB5C 00000000 */  nop
/* ECC60 001ECB60 10200000 */  mfhi       $4
/* ECC64 001ECB64 04000324 */  addiu      $3, $0, 0x4
/* ECC68 001ECB68 03008314 */  bne        $4, $3, .L001ECB78
/* ECC6C 001ECB6C 00000000 */   nop
/* ECC70 001ECB70 2886C072 */  paddub     $16, $22, $0
/* ECC74 001ECB74 28003126 */  addiu      $17, $17, 0x28
.L001ECB78:
/* ECC78 001ECB78 01005226 */  addiu      $18, $18, 0x1
.L001ECB7C:
/* ECC7C 001ECB7C 1E00432A */  slti       $3, $18, 0x1E
/* ECC80 001ECB80 BDFF6014 */  bnez       $3, .L001ECA78
/* ECC84 001ECB84 00000000 */   nop
/* ECC88 001ECB88 7000BF7B */  lq         $31, 0x70($sp)
/* ECC8C 001ECB8C 6000B67B */  lq         $22, 0x60($sp)
/* ECC90 001ECB90 5000B57B */  lq         $21, 0x50($sp)
/* ECC94 001ECB94 4000B47B */  lq         $20, 0x40($sp)
/* ECC98 001ECB98 3000B37B */  lq         $19, 0x30($sp)
/* ECC9C 001ECB9C 2000B27B */  lq         $18, 0x20($sp)
/* ECCA0 001ECBA0 1000B17B */  lq         $17, 0x10($sp)
/* ECCA4 001ECBA4 0000B07B */  lq         $16, 0x0($sp)
/* ECCA8 001ECBA8 8000BD27 */  addiu      $sp, $sp, 0x80
/* ECCAC 001ECBAC 0800E003 */  jr         $31
/* ECCB0 001ECBB0 00000000 */   nop
/* ECCB4 001ECBB4 00000000 */  nop
/* ECCB8 001ECBB8 00000000 */  nop
/* ECCBC 001ECBBC 00000000 */  nop
