.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_LIGHT__FP12RS_STACKDATAi
/* 93600 00193500 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 93604 00193504 5000BF7F */  sq         $31, 0x50($sp)
/* 93608 00193508 4000B47F */  sq         $20, 0x40($sp)
/* 9360C 0019350C 3000B37F */  sq         $19, 0x30($sp)
/* 93610 00193510 2000B27F */  sq         $18, 0x20($sp)
/* 93614 00193514 1000B17F */  sq         $17, 0x10($sp)
/* 93618 00193518 0000B07F */  sq         $16, 0x0($sp)
/* 9361C 0019351C 289EA070 */  paddub     $19, $5, $0
/* 93620 00193520 01000224 */  addiu      $2, $0, 0x1
/* 93624 00193524 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 93628 00193528 F0D422AC */  sw         $2, -0x2B10($at)
/* 9362C 0019352C 08009424 */  addiu      $20, $4, 0x8
/* 93630 00193530 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93634 00193534 00000000 */   nop
/* 93638 00193538 28864070 */  paddub     $16, $2, $0
/* 9363C 0019353C 04000006 */  bltz       $16, .L00193550
/* 93640 00193540 00000000 */   nop
/* 93644 00193544 0400012A */  slti       $at, $16, 0x4
/* 93648 00193548 04002014 */  bnez       $at, .L0019355C
/* 9364C 0019354C 00000000 */   nop
.L00193550:
/* 93650 00193550 28160070 */  paddub     $2, $0, $0
/* 93654 00193554 43000010 */  b          .L00193664
/* 93658 00193558 00000000 */   nop
.L0019355C:
/* 9365C 0019355C 28268072 */  paddub     $4, $20, $0
/* 93660 00193560 08009424 */  addiu      $20, $4, 0x8
/* 93664 00193564 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 93668 00193568 00000000 */   nop
/* 9366C 0019356C 6000A0E7 */  swc1       $f0, 0x60($sp)
/* 93670 00193570 28268072 */  paddub     $4, $20, $0
/* 93674 00193574 08009424 */  addiu      $20, $4, 0x8
/* 93678 00193578 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9367C 0019357C 00000000 */   nop
/* 93680 00193580 6400B127 */  addiu      $17, $sp, 0x64
/* 93684 00193584 000020E6 */  swc1       $f0, 0x0($17)
/* 93688 00193588 28268072 */  paddub     $4, $20, $0
/* 9368C 0019358C 08009424 */  addiu      $20, $4, 0x8
/* 93690 00193590 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 93694 00193594 00000000 */   nop
/* 93698 00193598 6800B227 */  addiu      $18, $sp, 0x68
/* 9369C 0019359C 000040E6 */  swc1       $f0, 0x0($18)
/* 936A0 001935A0 6C00A0AF */  sw         $0, 0x6C($sp)
/* 936A4 001935A4 6000A427 */  addiu      $4, $sp, 0x60
/* 936A8 001935A8 282E8070 */  paddub     $5, $4, $0
/* 936AC 001935AC 9285040C */  jal        sceVu0Normalize
/* 936B0 001935B0 00000000 */   nop
/* 936B4 001935B4 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* 936B8 001935B8 80181000 */  sll        $3, $16, 2
/* 936BC 001935BC D401023C */  lui        $2, %hi(D_1D3D500)
/* 936C0 001935C0 00D54224 */  addiu      $2, $2, %lo(D_1D3D500)
/* 936C4 001935C4 21104300 */  addu       $2, $2, $3
/* 936C8 001935C8 000040E4 */  swc1       $f0, 0x0($2)
/* 936CC 001935CC 000020C6 */  lwc1       $f0, 0x0($17)
/* 936D0 001935D0 D401023C */  lui        $2, %hi(D_1D3D510)
/* 936D4 001935D4 10D54224 */  addiu      $2, $2, %lo(D_1D3D510)
/* 936D8 001935D8 21104300 */  addu       $2, $2, $3
/* 936DC 001935DC 000040E4 */  swc1       $f0, 0x0($2)
/* 936E0 001935E0 000040C6 */  lwc1       $f0, 0x0($18)
/* 936E4 001935E4 D401023C */  lui        $2, %hi(D_1D3D520)
/* 936E8 001935E8 20D54224 */  addiu      $2, $2, %lo(D_1D3D520)
/* 936EC 001935EC 21104300 */  addu       $2, $2, $3
/* 936F0 001935F0 000040E4 */  swc1       $f0, 0x0($2)
/* 936F4 001935F4 0500612A */  slti       $at, $19, 0x5
/* 936F8 001935F8 19002014 */  bnez       $at, .L00193660
/* 936FC 001935FC 00000000 */   nop
/* 93700 00193600 28268072 */  paddub     $4, $20, $0
/* 93704 00193604 08009424 */  addiu      $20, $4, 0x8
/* 93708 00193608 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9370C 0019360C 00000000 */   nop
/* 93710 00193610 00191000 */  sll        $3, $16, 4
/* 93714 00193614 D401023C */  lui        $2, %hi(D_1D3D540)
/* 93718 00193618 40D54224 */  addiu      $2, $2, %lo(D_1D3D540)
/* 9371C 0019361C 21104300 */  addu       $2, $2, $3
/* 93720 00193620 000040E4 */  swc1       $f0, 0x0($2)
/* 93724 00193624 28268072 */  paddub     $4, $20, $0
/* 93728 00193628 08009424 */  addiu      $20, $4, 0x8
/* 9372C 0019362C E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 93730 00193630 00000000 */   nop
/* 93734 00193634 D401023C */  lui        $2, %hi(D_1D3D544)
/* 93738 00193638 44D54224 */  addiu      $2, $2, %lo(D_1D3D544)
/* 9373C 0019363C 21104300 */  addu       $2, $2, $3
/* 93740 00193640 000040E4 */  swc1       $f0, 0x0($2)
/* 93744 00193644 28268072 */  paddub     $4, $20, $0
/* 93748 00193648 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9374C 0019364C 00000000 */   nop
/* 93750 00193650 D401023C */  lui        $2, %hi(D_1D3D548)
/* 93754 00193654 48D54224 */  addiu      $2, $2, %lo(D_1D3D548)
/* 93758 00193658 21104300 */  addu       $2, $2, $3
/* 9375C 0019365C 000040E4 */  swc1       $f0, 0x0($2)
.L00193660:
/* 93760 00193660 01000224 */  addiu      $2, $0, 0x1
.L00193664:
/* 93764 00193664 5000BF7B */  lq         $31, 0x50($sp)
/* 93768 00193668 4000B47B */  lq         $20, 0x40($sp)
/* 9376C 0019366C 3000B37B */  lq         $19, 0x30($sp)
/* 93770 00193670 2000B27B */  lq         $18, 0x20($sp)
/* 93774 00193674 1000B17B */  lq         $17, 0x10($sp)
/* 93778 00193678 0000B07B */  lq         $16, 0x0($sp)
/* 9377C 0019367C 7000BD27 */  addiu      $sp, $sp, 0x70
/* 93780 00193680 0800E003 */  jr         $31
/* 93784 00193684 00000000 */   nop
/* 93788 00193688 00000000 */  nop
/* 9378C 0019368C 00000000 */  nop
