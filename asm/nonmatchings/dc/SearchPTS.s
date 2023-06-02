.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchPTS__FPUiPc
/* 3E5E0 0013E4E0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 3E5E4 0013E4E4 4000BF7F */  sq         $31, 0x40($sp)
/* 3E5E8 0013E4E8 3000B37F */  sq         $19, 0x30($sp)
/* 3E5EC 0013E4EC 2000B27F */  sq         $18, 0x20($sp)
/* 3E5F0 0013E4F0 1000B17F */  sq         $17, 0x10($sp)
/* 3E5F4 0013E4F4 0000B07F */  sq         $16, 0x0($sp)
/* 3E5F8 0013E4F8 288E8070 */  paddub     $17, $4, $0
/* 3E5FC 0013E4FC 04002016 */  bnez       $17, .L0013E510
/* 3E600 0013E500 00000000 */   nop
/* 3E604 0013E504 28160070 */  paddub     $2, $0, $0
/* 3E608 0013E508 23000010 */  b          .L0013E598
/* 3E60C 0013E50C 00000000 */   nop
.L0013E510:
/* 3E610 0013E510 10003226 */  addiu      $18, $17, 0x10
/* 3E614 0013E514 289EA070 */  paddub     $19, $5, $0
/* 3E618 0013E518 08000010 */  b          .L0013E53C
/* 3E61C 0013E51C 00000000 */   nop
.L0013E520:
/* 3E620 0013E520 3C1E0200 */  dsll32     $3, $2, 24
/* 3E624 0013E524 3F1E0300 */  dsra32     $3, $3, 24
/* 3E628 0013E528 2F000224 */  addiu      $2, $0, 0x2F
/* 3E62C 0013E52C 02006214 */  bne        $3, $2, .L0013E538
/* 3E630 0013E530 00000000 */   nop
/* 3E634 0013E534 0100B324 */  addiu      $19, $5, 0x1
.L0013E538:
/* 3E638 0013E538 0100A524 */  addiu      $5, $5, 0x1
.L0013E53C:
/* 3E63C 0013E53C 0000A280 */  lb         $2, 0x0($5)
/* 3E640 0013E540 F7FF4014 */  bnez       $2, .L0013E520
/* 3E644 0013E544 00000000 */   nop
/* 3E648 0013E548 28860070 */  paddub     $16, $0, $0
/* 3E64C 0013E54C 0D000010 */  b          .L0013E584
/* 3E650 0013E550 00000000 */   nop
.L0013E554:
/* 3E654 0013E554 28266072 */  paddub     $4, $19, $0
/* 3E658 0013E558 282E4072 */  paddub     $5, $18, $0
/* 3E65C 0013E55C 0815040C */  jal        strcmp
/* 3E660 0013E560 00000000 */   nop
/* 3E664 0013E564 05004014 */  bnez       $2, .L0013E57C
/* 3E668 0013E568 00000000 */   nop
/* 3E66C 0013E56C 1000428E */  lw         $2, 0x10($18)
/* 3E670 0013E570 21102202 */  addu       $2, $17, $2
/* 3E674 0013E574 08000010 */  b          .L0013E598
/* 3E678 0013E578 00000000 */   nop
.L0013E57C:
/* 3E67C 0013E57C 01001026 */  addiu      $16, $16, 0x1
/* 3E680 0013E580 30005226 */  addiu      $18, $18, 0x30
.L0013E584:
/* 3E684 0013E584 0400228E */  lw         $2, 0x4($17)
/* 3E688 0013E588 2A100202 */  slt        $2, $16, $2
/* 3E68C 0013E58C F1FF4014 */  bnez       $2, .L0013E554
/* 3E690 0013E590 00000000 */   nop
/* 3E694 0013E594 28160070 */  paddub     $2, $0, $0
.L0013E598:
/* 3E698 0013E598 4000BF7B */  lq         $31, 0x40($sp)
/* 3E69C 0013E59C 3000B37B */  lq         $19, 0x30($sp)
/* 3E6A0 0013E5A0 2000B27B */  lq         $18, 0x20($sp)
/* 3E6A4 0013E5A4 1000B17B */  lq         $17, 0x10($sp)
/* 3E6A8 0013E5A8 0000B07B */  lq         $16, 0x0($sp)
/* 3E6AC 0013E5AC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 3E6B0 0013E5B0 0800E003 */  jr         $31
/* 3E6B4 0013E5B4 00000000 */   nop
/* 3E6B8 0013E5B8 00000000 */  nop
/* 3E6BC 0013E5BC 00000000 */  nop
