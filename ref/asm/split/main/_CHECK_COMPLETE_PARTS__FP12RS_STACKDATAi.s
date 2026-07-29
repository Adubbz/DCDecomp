.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_COMPLETE_PARTS__FP12RS_STACKDATAi
/* 090550 00190450 E0FFBD27 */  addiu       $29, $29, -0x20
/* 090554 00190454 1000BF7F */  sq          $31, 0x10($29)
/* 090558 00190458 0000B07F */  sq          $16, 0x0($29)
/* 09055C 0019045C 0200A128 */  slti        $1, $5, 0x2
/* 090560 00190460 04002010 */  beqz        $1, .L00190474
/* 090564 00190464 00000000 */   nop
/* 090568 00190468 28160070 */  paddub      $2, $0, $0
/* 09056C 0019046C 0E000010 */  b           .L001904A8
/* 090570 00190470 00000000 */   nop
.L00190474:
/* 090574 00190474 08009024 */  addiu       $16, $4, 0x8
/* 090578 00190478 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09057C 0019047C 00000000 */   nop
/* 090580 00190480 D201033C */  lui         $3, %hi(EditPartsInfo)
/* 090584 00190484 F09B6424 */  addiu       $4, $3, %lo(EditPartsInfo)
/* 090588 00190488 282E4070 */  paddub      $5, $2, $0
/* 09058C 0019048C 0868060C */  jal         CheckComplete__14CEditPartsInfoFi
/* 090590 00190490 00000000 */   nop
/* 090594 00190494 282E4070 */  paddub      $5, $2, $0
/* 090598 00190498 28260072 */  paddub      $4, $16, $0
/* 09059C 0019049C F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0905A0 001904A0 00000000 */   nop
/* 0905A4 001904A4 01000224 */  addiu       $2, $0, 0x1
.L001904A8:
/* 0905A8 001904A8 1000BF7B */  lq          $31, 0x10($29)
/* 0905AC 001904AC 0000B07B */  lq          $16, 0x0($29)
/* 0905B0 001904B0 2000BD27 */  addiu       $29, $29, 0x20
/* 0905B4 001904B4 0800E003 */  jr          $31
/* 0905B8 001904B8 00000000 */   nop
/* 0905BC 001904BC 00000000 */  nop
