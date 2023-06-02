.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCharaChangeReadCharaFilePath__FPci
/* 10E630 0020E530 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 10E634 0020E534 2000BF7F */  sq         $31, 0x20($sp)
/* 10E638 0020E538 1000B17F */  sq         $17, 0x10($sp)
/* 10E63C 0020E53C 0000B07F */  sq         $16, 0x0($sp)
/* 10E640 0020E540 288E8070 */  paddub     $17, $4, $0
/* 10E644 0020E544 2886A070 */  paddub     $16, $5, $0
/* 10E648 0020E548 2900023C */  lui        $2, %hi(readFilePath)
/* 10E64C 0020E54C 903B4524 */  addiu      $5, $2, %lo(readFilePath)
/* 10E650 0020E550 5A15040C */  jal        strcpy
/* 10E654 0020E554 00000000 */   nop
/* 10E658 0020E558 80181000 */  sll        $3, $16, 2
/* 10E65C 0020E55C 2900023C */  lui        $2, %hi(charaFile)
/* 10E660 0020E560 D03B4224 */  addiu      $2, $2, %lo(charaFile)
/* 10E664 0020E564 21104300 */  addu       $2, $2, $3
/* 10E668 0020E568 28262072 */  paddub     $4, $17, $0
/* 10E66C 0020E56C 0000458C */  lw         $5, 0x0($2)
/* 10E670 0020E570 BC14040C */  jal        strcat
/* 10E674 0020E574 00000000 */   nop
/* 10E678 0020E578 28262072 */  paddub     $4, $17, $0
/* 10E67C 0020E57C 2A00023C */  lui        $2, %hi(_1037_2)
/* 10E680 0020E580 18DF4524 */  addiu      $5, $2, %lo(_1037_2)
/* 10E684 0020E584 BC14040C */  jal        strcat
/* 10E688 0020E588 00000000 */   nop
/* 10E68C 0020E58C 2000BF7B */  lq         $31, 0x20($sp)
/* 10E690 0020E590 1000B17B */  lq         $17, 0x10($sp)
/* 10E694 0020E594 0000B07B */  lq         $16, 0x0($sp)
/* 10E698 0020E598 3000BD27 */  addiu      $sp, $sp, 0x30
/* 10E69C 0020E59C 0800E003 */  jr         $31
/* 10E6A0 0020E5A0 00000000 */   nop
/* 10E6A4 0020E5A4 00000000 */  nop
/* 10E6A8 0020E5A8 00000000 */  nop
/* 10E6AC 0020E5AC 00000000 */  nop
