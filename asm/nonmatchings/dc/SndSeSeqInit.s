.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSeSeqInit__Fv
/* 5AFD0 0015AED0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5AFD4 0015AED4 0000BF7F */  sq         $31, 0x0($sp)
/* 5AFD8 0015AED8 282E0070 */  paddub     $5, $0, $0
/* 5AFDC 0015AEDC 08000010 */  b          .L0015AF00
/* 5AFE0 0015AEE0 00000000 */   nop
.L0015AEE4:
/* 5AFE4 0015AEE4 C0200500 */  sll        $4, $5, 3
/* 5AFE8 0015AEE8 D001033C */  lui        $3, %hi(se_seq)
/* 5AFEC 0015AEEC 30B56324 */  addiu      $3, $3, %lo(se_seq)
/* 5AFF0 0015AEF0 21206400 */  addu       $4, $3, $4
/* 5AFF4 0015AEF4 806B050C */  jal        InitSeSeq__FP10SND_SE_SEQ
/* 5AFF8 0015AEF8 00000000 */   nop
/* 5AFFC 0015AEFC 0100A524 */  addiu      $5, $5, 0x1
.L0015AF00:
/* 5B000 0015AF00 2000A328 */  slti       $3, $5, 0x20
/* 5B004 0015AF04 F7FF6014 */  bnez       $3, .L0015AEE4
/* 5B008 0015AF08 00000000 */   nop
/* 5B00C 0015AF0C 0000BF7B */  lq         $31, 0x0($sp)
/* 5B010 0015AF10 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5B014 0015AF14 0800E003 */  jr         $31
/* 5B018 0015AF18 00000000 */   nop
/* 5B01C 0015AF1C 00000000 */  nop
