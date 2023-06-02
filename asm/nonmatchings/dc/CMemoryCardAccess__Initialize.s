.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__17CMemoryCardAccessFv
/* 1136D0 002135D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1136D4 002135D4 1000BF7F */  sq         $31, 0x10($sp)
/* 1136D8 002135D8 0000B07F */  sq         $16, 0x0($sp)
/* 1136DC 002135DC 28868070 */  paddub     $16, $4, $0
/* 1136E0 002135E0 80AE080C */  jal        GetMenuLangFlag__Fv
/* 1136E4 002135E4 00000000 */   nop
/* 1136E8 002135E8 01000324 */  addiu      $3, $0, 0x1
/* 1136EC 002135EC 0C004310 */  beq        $2, $3, .L00213620
/* 1136F0 002135F0 00000000 */   nop
/* 1136F4 002135F4 03004010 */  beqz       $2, .L00213604
/* 1136F8 002135F8 00000000 */   nop
/* 1136FC 002135FC 08000010 */  b          .L00213620
/* 113700 00213600 00000000 */   nop
.L00213604:
/* 113704 00213604 3C000426 */  addiu      $4, $16, 0x3C
/* 113708 00213608 2A00023C */  lui        $2, %hi(_372_3)
/* 11370C 0021360C D0E44524 */  addiu      $5, $2, %lo(_372_3)
/* 113710 00213610 5A15040C */  jal        strcpy
/* 113714 00213614 00000000 */   nop
/* 113718 00213618 06000010 */  b          .L00213634
/* 11371C 0021361C 00000000 */   nop
.L00213620:
/* 113720 00213620 3C000426 */  addiu      $4, $16, 0x3C
/* 113724 00213624 2A00023C */  lui        $2, %hi(_373_4)
/* 113728 00213628 F0E44524 */  addiu      $5, $2, %lo(_373_4)
/* 11372C 0021362C 5A15040C */  jal        strcpy
/* 113730 00213630 00000000 */   nop
.L00213634:
/* 113734 00213634 5C000426 */  addiu      $4, $16, 0x5C
/* 113738 00213638 2A00023C */  lui        $2, %hi(_374_3)
/* 11373C 0021363C 08E54524 */  addiu      $5, $2, %lo(_374_3)
/* 113740 00213640 5A15040C */  jal        strcpy
/* 113744 00213644 00000000 */   nop
/* 113748 00213648 281E0070 */  paddub     $3, $0, $0
/* 11374C 0021364C 04000010 */  b          .L00213660
/* 113750 00213650 00000000 */   nop
.L00213654:
/* 113754 00213654 21107000 */  addu       $2, $3, $16
/* 113758 00213658 7C0040A0 */  sb         $0, 0x7C($2)
/* 11375C 0021365C 01006324 */  addiu      $3, $3, 0x1
.L00213660:
/* 113760 00213660 40006228 */  slti       $2, $3, 0x40
/* 113764 00213664 FBFF4014 */  bnez       $2, .L00213654
/* 113768 00213668 00000000 */   nop
/* 11376C 0021366C 000000AE */  sw         $0, 0x0($16)
/* 113770 00213670 040000AE */  sw         $0, 0x4($16)
/* 113774 00213674 FFFF0224 */  addiu      $2, $0, -0x1
/* 113778 00213678 C80002AE */  sw         $2, 0xC8($16)
/* 11377C 0021367C 08000426 */  addiu      $4, $16, 0x8
/* 113780 00213680 282E0070 */  paddub     $5, $0, $0
/* 113784 00213684 14000624 */  addiu      $6, $0, 0x14
/* 113788 00213688 5A0D040C */  jal        memset
/* 11378C 0021368C 00000000 */   nop
/* 113790 00213690 28260072 */  paddub     $4, $16, $0
/* 113794 00213694 2A00023C */  lui        $2, %hi(_375_4)
/* 113798 00213698 20E54524 */  addiu      $5, $2, %lo(_375_4)
/* 11379C 0021369C 6C4F080C */  jal        SetVersion__17CMemoryCardAccessFPc
/* 1137A0 002136A0 00000000 */   nop
/* 1137A4 002136A4 01000224 */  addiu      $2, $0, 0x1
/* 1137A8 002136A8 BC0002AE */  sw         $2, 0xBC($16)
/* 1137AC 002136AC 3D000224 */  addiu      $2, $0, 0x3D
/* 1137B0 002136B0 E00002AE */  sw         $2, 0xE0($16)
/* 1137B4 002136B4 C40000AE */  sw         $0, 0xC4($16)
/* 1137B8 002136B8 D00000AE */  sw         $0, 0xD0($16)
/* 1137BC 002136BC D80000AE */  sw         $0, 0xD8($16)
/* 1137C0 002136C0 DC0000AE */  sw         $0, 0xDC($16)
/* 1137C4 002136C4 DA01023C */  lui        $2, %hi(SaveFileInfo)
/* 1137C8 002136C8 80EF4224 */  addiu      $2, $2, %lo(SaveFileInfo)
/* 1137CC 002136CC CC0002AE */  sw         $2, 0xCC($16)
/* 1137D0 002136D0 E40000AE */  sw         $0, 0xE4($16)
/* 1137D4 002136D4 E80000AE */  sw         $0, 0xE8($16)
/* 1137D8 002136D8 D4040426 */  addiu      $4, $16, 0x4D4
/* 1137DC 002136DC 282E0070 */  paddub     $5, $0, $0
/* 1137E0 002136E0 48000624 */  addiu      $6, $0, 0x48
/* 1137E4 002136E4 5A0D040C */  jal        memset
/* 1137E8 002136E8 00000000 */   nop
/* 1137EC 002136EC 1C050426 */  addiu      $4, $16, 0x51C
/* 1137F0 002136F0 282E0070 */  paddub     $5, $0, $0
/* 1137F4 002136F4 A0020624 */  addiu      $6, $0, 0x2A0
/* 1137F8 002136F8 5A0D040C */  jal        memset
/* 1137FC 002136FC 00000000 */   nop
/* 113800 00213700 B0040426 */  addiu      $4, $16, 0x4B0
/* 113804 00213704 282E0070 */  paddub     $5, $0, $0
/* 113808 00213708 24000624 */  addiu      $6, $0, 0x24
/* 11380C 0021370C 5A0D040C */  jal        memset
/* 113810 00213710 00000000 */   nop
/* 113814 00213714 01000224 */  addiu      $2, $0, 0x1
/* 113818 00213718 D40402AE */  sw         $2, 0x4D4($16)
/* 11381C 0021371C F80402AE */  sw         $2, 0x4F8($16)
/* 113820 00213720 2A00023C */  lui        $2, %hi(_376_4)
/* 113824 00213724 30E54424 */  addiu      $4, $2, %lo(_376_4)
/* 113828 00213728 0100023C */  lui        $2, (0x131C0 >> 16)
/* 11382C 0021372C C0314534 */  ori        $5, $2, (0x131C0 & 0xFFFF)
/* 113830 00213730 A611040C */  jal        printf
/* 113834 00213734 00000000 */   nop
/* 113838 00213738 1000BF7B */  lq         $31, 0x10($sp)
/* 11383C 0021373C 0000B07B */  lq         $16, 0x0($sp)
/* 113840 00213740 2000BD27 */  addiu      $sp, $sp, 0x20
/* 113844 00213744 0800E003 */  jr         $31
/* 113848 00213748 00000000 */   nop
/* 11384C 0021374C 00000000 */  nop
