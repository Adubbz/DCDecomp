.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_ITEM_UNIT_NO__FP12RS_STACKDATAi
/* BD700 001BD600 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BD704 001BD604 1000BF7F */  sq         $31, 0x10($sp)
/* BD708 001BD608 0000B07F */  sq         $16, 0x0($sp)
/* BD70C 001BD60C 08009024 */  addiu      $16, $4, 0x8
/* BD710 001BD610 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BD714 001BD614 00000000 */   nop
/* BD718 001BD618 FFFF0524 */  addiu      $5, $0, -0x1
/* BD71C 001BD61C 01014328 */  slti       $3, $2, 0x101
/* BD720 001BD620 27006014 */  bnez       $3, .L001BD6C0
/* BD724 001BD624 00000000 */   nop
/* BD728 001BD628 05006014 */  bnez       $3, .L001BD640
/* BD72C 001BD62C 00000000 */   nop
/* BD730 001BD630 2B014128 */  slti       $at, $2, 0x12B
/* BD734 001BD634 02002010 */  beqz       $at, .L001BD640
/* BD738 001BD638 00000000 */   nop
/* BD73C 001BD63C 282E0070 */  paddub     $5, $0, $0
.L001BD640:
/* BD740 001BD640 2B014328 */  slti       $3, $2, 0x12B
/* BD744 001BD644 05006014 */  bnez       $3, .L001BD65C
/* BD748 001BD648 00000000 */   nop
/* BD74C 001BD64C 3A014128 */  slti       $at, $2, 0x13A
/* BD750 001BD650 02002010 */  beqz       $at, .L001BD65C
/* BD754 001BD654 00000000 */   nop
/* BD758 001BD658 01000524 */  addiu      $5, $0, 0x1
.L001BD65C:
/* BD75C 001BD65C 3A014328 */  slti       $3, $2, 0x13A
/* BD760 001BD660 05006014 */  bnez       $3, .L001BD678
/* BD764 001BD664 00000000 */   nop
/* BD768 001BD668 4B014128 */  slti       $at, $2, 0x14B
/* BD76C 001BD66C 02002010 */  beqz       $at, .L001BD678
/* BD770 001BD670 00000000 */   nop
/* BD774 001BD674 02000524 */  addiu      $5, $0, 0x2
.L001BD678:
/* BD778 001BD678 4B014328 */  slti       $3, $2, 0x14B
/* BD77C 001BD67C 05006014 */  bnez       $3, .L001BD694
/* BD780 001BD680 00000000 */   nop
/* BD784 001BD684 5B014128 */  slti       $at, $2, 0x15B
/* BD788 001BD688 02002010 */  beqz       $at, .L001BD694
/* BD78C 001BD68C 00000000 */   nop
/* BD790 001BD690 03000524 */  addiu      $5, $0, 0x3
.L001BD694:
/* BD794 001BD694 5B014328 */  slti       $3, $2, 0x15B
/* BD798 001BD698 05006014 */  bnez       $3, .L001BD6B0
/* BD79C 001BD69C 00000000 */   nop
/* BD7A0 001BD6A0 6B014128 */  slti       $at, $2, 0x16B
/* BD7A4 001BD6A4 02002010 */  beqz       $at, .L001BD6B0
/* BD7A8 001BD6A8 00000000 */   nop
/* BD7AC 001BD6AC 04000524 */  addiu      $5, $0, 0x4
.L001BD6B0:
/* BD7B0 001BD6B0 6B014228 */  slti       $2, $2, 0x16B
/* BD7B4 001BD6B4 02004014 */  bnez       $2, .L001BD6C0
/* BD7B8 001BD6B8 00000000 */   nop
/* BD7BC 001BD6BC 05000524 */  addiu      $5, $0, 0x5
.L001BD6C0:
/* BD7C0 001BD6C0 28260072 */  paddub     $4, $16, $0
/* BD7C4 001BD6C4 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD7C8 001BD6C8 00000000 */   nop
/* BD7CC 001BD6CC 01000224 */  addiu      $2, $0, 0x1
/* BD7D0 001BD6D0 1000BF7B */  lq         $31, 0x10($sp)
/* BD7D4 001BD6D4 0000B07B */  lq         $16, 0x0($sp)
/* BD7D8 001BD6D8 2000BD27 */  addiu      $sp, $sp, 0x20
/* BD7DC 001BD6DC 0800E003 */  jr         $31
/* BD7E0 001BD6E0 00000000 */   nop
/* BD7E4 001BD6E4 00000000 */  nop
/* BD7E8 001BD6E8 00000000 */  nop
/* BD7EC 001BD6EC 00000000 */  nop
