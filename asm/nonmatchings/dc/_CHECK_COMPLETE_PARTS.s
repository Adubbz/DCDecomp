.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_COMPLETE_PARTS__FP12RS_STACKDATAi
/* 90550 00190450 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 90554 00190454 1000BF7F */  sq         $31, 0x10($sp)
/* 90558 00190458 0000B07F */  sq         $16, 0x0($sp)
/* 9055C 0019045C 0200A128 */  slti       $at, $5, 0x2
/* 90560 00190460 04002010 */  beqz       $at, .L00190474
/* 90564 00190464 00000000 */   nop
/* 90568 00190468 28160070 */  paddub     $2, $0, $0
/* 9056C 0019046C 0E000010 */  b          .L001904A8
/* 90570 00190470 00000000 */   nop
.L00190474:
/* 90574 00190474 08009024 */  addiu      $16, $4, 0x8
/* 90578 00190478 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9057C 0019047C 00000000 */   nop
/* 90580 00190480 D201033C */  lui        $3, %hi(EditPartsInfo)
/* 90584 00190484 F09B6424 */  addiu      $4, $3, %lo(EditPartsInfo)
/* 90588 00190488 282E4070 */  paddub     $5, $2, $0
/* 9058C 0019048C 0868060C */  jal        CheckComplete__14CEditPartsInfoFi
/* 90590 00190490 00000000 */   nop
/* 90594 00190494 282E4070 */  paddub     $5, $2, $0
/* 90598 00190498 28260072 */  paddub     $4, $16, $0
/* 9059C 0019049C F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 905A0 001904A0 00000000 */   nop
/* 905A4 001904A4 01000224 */  addiu      $2, $0, 0x1
.L001904A8:
/* 905A8 001904A8 1000BF7B */  lq         $31, 0x10($sp)
/* 905AC 001904AC 0000B07B */  lq         $16, 0x0($sp)
/* 905B0 001904B0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 905B4 001904B4 0800E003 */  jr         $31
/* 905B8 001904B8 00000000 */   nop
/* 905BC 001904BC 00000000 */  nop
