.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _INIT_CHARA__FP12RS_STACKDATAi
/* 8D520 0018D420 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8D524 0018D424 3000BF7F */  sq         $31, 0x30($sp)
/* 8D528 0018D428 2000B27F */  sq         $18, 0x20($sp)
/* 8D52C 0018D42C 1000B17F */  sq         $17, 0x10($sp)
/* 8D530 0018D430 0000B07F */  sq         $16, 0x0($sp)
/* 8D534 0018D434 28968070 */  paddub     $18, $4, $0
/* 8D538 0018D438 288EA070 */  paddub     $17, $5, $0
/* 8D53C 0018D43C 28860070 */  paddub     $16, $0, $0
/* 8D540 0018D440 10000010 */  b          .L0018D484
/* 8D544 0018D444 00000000 */   nop
.L0018D448:
/* 8D548 0018D448 28264072 */  paddub     $4, $18, $0
/* 8D54C 0018D44C 08009224 */  addiu      $18, $4, 0x8
/* 8D550 0018D450 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D554 0018D454 00000000 */   nop
/* 8D558 0018D458 28264070 */  paddub     $4, $2, $0
/* 8D55C 0018D45C 702C060C */  jal        GetNPC__Fi
/* 8D560 0018D460 00000000 */   nop
/* 8D564 0018D464 06004010 */  beqz       $2, .L0018D480
/* 8D568 0018D468 00000000 */   nop
/* 8D56C 0018D46C 28264070 */  paddub     $4, $2, $0
/* 8D570 0018D470 A000598C */  lw         $25, 0xA0($2)
/* 8D574 0018D474 C400398F */  lw         $25, 0xC4($25)
/* 8D578 0018D478 09F82003 */  jalr       $25
/* 8D57C 0018D47C 00000000 */   nop
.L0018D480:
/* 8D580 0018D480 01001026 */  addiu      $16, $16, 0x1
.L0018D484:
/* 8D584 0018D484 2A101102 */  slt        $2, $16, $17
/* 8D588 0018D488 EFFF4014 */  bnez       $2, .L0018D448
/* 8D58C 0018D48C 00000000 */   nop
/* 8D590 0018D490 01000224 */  addiu      $2, $0, 0x1
/* 8D594 0018D494 3000BF7B */  lq         $31, 0x30($sp)
/* 8D598 0018D498 2000B27B */  lq         $18, 0x20($sp)
/* 8D59C 0018D49C 1000B17B */  lq         $17, 0x10($sp)
/* 8D5A0 0018D4A0 0000B07B */  lq         $16, 0x0($sp)
/* 8D5A4 0018D4A4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8D5A8 0018D4A8 0800E003 */  jr         $31
/* 8D5AC 0018D4AC 00000000 */   nop
