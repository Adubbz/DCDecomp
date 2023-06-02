.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_USER_STATUS__FP12RS_STACKDATAi
/* E65F0 001E64F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E65F4 001E64F4 1000BF7F */  sq         $31, 0x10($sp)
/* E65F8 001E64F8 0000B07F */  sq         $16, 0x0($sp)
/* E65FC 001E64FC 08009024 */  addiu      $16, $4, 0x8
/* E6600 001E6500 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E6604 001E6504 00000000 */   nop
/* E6608 001E6508 789C868F */  lw         $6, -0x6388($gp)
/* E660C 001E650C 0400C480 */  lb         $4, 0x4($6)
/* E6610 001E6510 282E0070 */  paddub     $5, $0, $0
/* E6614 001E6514 80180400 */  sll        $3, $4, 2
/* E6618 001E6518 21186600 */  addu       $3, $3, $6
/* E661C 001E651C C842638C */  lw         $3, 0x42C8($3)
/* E6620 001E6520 07006010 */  beqz       $3, .L001E6540
/* E6624 001E6524 00000000 */   nop
/* E6628 001E6528 05004010 */  beqz       $2, .L001E6540
/* E662C 001E652C 00000000 */   nop
/* E6630 001E6530 40100400 */  sll        $2, $4, 1
/* E6634 001E6534 21104600 */  addu       $2, $2, $6
/* E6638 001E6538 E0424584 */  lh         $5, 0x42E0($2)
/* E663C 001E653C 00000000 */  nop
.L001E6540:
/* E6640 001E6540 28260072 */  paddub     $4, $16, $0
/* E6644 001E6544 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E6648 001E6548 00000000 */   nop
/* E664C 001E654C 01000224 */  addiu      $2, $0, 0x1
/* E6650 001E6550 1000BF7B */  lq         $31, 0x10($sp)
/* E6654 001E6554 0000B07B */  lq         $16, 0x0($sp)
/* E6658 001E6558 2000BD27 */  addiu      $sp, $sp, 0x20
/* E665C 001E655C 0800E003 */  jr         $31
/* E6660 001E6560 00000000 */   nop
/* E6664 001E6564 00000000 */  nop
/* E6668 001E6568 00000000 */  nop
/* E666C 001E656C 00000000 */  nop
