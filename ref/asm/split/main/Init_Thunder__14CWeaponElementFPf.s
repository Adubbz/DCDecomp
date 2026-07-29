.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Init_Thunder__14CWeaponElementFPf
/* 0BA5F0 001BA4F0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 0BA5F4 001BA4F4 8000BF7F */  sq          $31, 0x80($29)
/* 0BA5F8 001BA4F8 7000B77F */  sq          $23, 0x70($29)
/* 0BA5FC 001BA4FC 6000B67F */  sq          $22, 0x60($29)
/* 0BA600 001BA500 5000B57F */  sq          $21, 0x50($29)
/* 0BA604 001BA504 4000B47F */  sq          $20, 0x40($29)
/* 0BA608 001BA508 3000B37F */  sq          $19, 0x30($29)
/* 0BA60C 001BA50C 2000B27F */  sq          $18, 0x20($29)
/* 0BA610 001BA510 1000B17F */  sq          $17, 0x10($29)
/* 0BA614 001BA514 0000B07F */  sq          $16, 0x0($29)
/* 0BA618 001BA518 28AE8070 */  paddub      $21, $4, $0
/* 0BA61C 001BA51C 28A6A070 */  paddub      $20, $5, $0
/* 0BA620 001BA520 9041023C */  lui         $2, (0x41900000 >> 16)
/* 0BA624 001BA524 00088244 */  mtc1        $2, $f1
/* 0BA628 001BA528 A80580C4 */  lwc1        $f0, 0x5A8($4)
/* 0BA62C 001BA52C 020B0046 */  mul.s       $f12, $f1, $f0
/* 0BA630 001BA530 2C44040C */  jal         fptosi
/* 0BA634 001BA534 00000000 */   nop
/* 0BA638 001BA538 06004224 */  addiu       $2, $2, 0x6
/* 0BA63C 001BA53C AE05A2A6 */  sh          $2, 0x5AE($21)
/* 0BA640 001BA540 E040023C */  lui         $2, (0x40E00000 >> 16)
/* 0BA644 001BA544 00088244 */  mtc1        $2, $f1
/* 0BA648 001BA548 A805A0C6 */  lwc1        $f0, 0x5A8($21)
/* 0BA64C 001BA54C 020B0046 */  mul.s       $f12, $f1, $f0
/* 0BA650 001BA550 2C44040C */  jal         fptosi
/* 0BA654 001BA554 00000000 */   nop
/* 0BA658 001BA558 01004224 */  addiu       $2, $2, 0x1
/* 0BA65C 001BA55C BC07A2A6 */  sh          $2, 0x7BC($21)
/* 0BA660 001BA560 6C8381C7 */  lwc1        $f1, -0x7C94($28)
/* 0BA664 001BA564 A805A0C6 */  lwc1        $f0, 0x5A8($21)
/* 0BA668 001BA568 020B0046 */  mul.s       $f12, $f1, $f0
/* 0BA66C 001BA56C 9044040C */  jal         fptodp
/* 0BA670 001BA570 00000000 */   nop
/* 0BA674 001BA574 688084DF */  ld          $4, -0x7F98($28)
/* 0BA678 001BA578 282E4070 */  paddub      $5, $2, $0
/* 0BA67C 001BA57C 6E3F040C */  jal         dpadd
/* 0BA680 001BA580 00000000 */   nop
/* 0BA684 001BA584 28264070 */  paddub      $4, $2, $0
/* 0BA688 001BA588 9241040C */  jal         dptofp
/* 0BA68C 001BA58C 00000000 */   nop
/* 0BA690 001BA590 A005A1C6 */  lwc1        $f1, 0x5A0($21)
/* 0BA694 001BA594 02080046 */  mul.s       $f0, $f1, $f0
/* 0BA698 001BA598 A005A0E6 */  swc1        $f0, 0x5A0($21)
/* 0BA69C 001BA59C 28860070 */  paddub      $16, $0, $0
/* 0BA6A0 001BA5A0 BB000010 */  b           .L001BA890
/* 0BA6A4 001BA5A4 00000000 */   nop
.L001BA5A8:
/* 0BA6A8 001BA5A8 BE11040C */  jal         rand
/* 0BA6AC 001BA5AC 00000000 */   nop
/* 0BA6B0 001BA5B0 00008244 */  mtc1        $2, $f0
/* 0BA6B4 001BA5B4 00000000 */  nop
/* 0BA6B8 001BA5B8 60008046 */  cvt.s.w     $f1, $f0
/* 0BA6BC 001BA5BC 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0BA6C0 001BA5C0 00008244 */  mtc1        $2, $f0
/* 0BA6C4 001BA5C4 00000000 */  nop
/* 0BA6C8 001BA5C8 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA6CC 001BA5CC 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA6D0 001BA5D0 00008244 */  mtc1        $2, $f0
/* 0BA6D4 001BA5D4 00000000 */  nop
/* 0BA6D8 001BA5D8 43080046 */  div.s       $f1, $f1, $f0
/* 0BA6DC 001BA5DC 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0BA6E0 001BA5E0 00008244 */  mtc1        $2, $f0
/* 0BA6E4 001BA5E4 00000000 */  nop
/* 0BA6E8 001BA5E8 01080046 */  sub.s       $f0, $f1, $f0
/* 0BA6EC 001BA5EC 00891000 */  sll         $17, $16, 4
/* 0BA6F0 001BA5F0 21103502 */  addu        $2, $17, $21
/* 0BA6F4 001BA5F4 20025724 */  addiu       $23, $2, 0x220
/* 0BA6F8 001BA5F8 200240E4 */  swc1        $f0, 0x220($2)
/* 0BA6FC 001BA5FC BE11040C */  jal         rand
/* 0BA700 001BA600 00000000 */   nop
/* 0BA704 001BA604 00008244 */  mtc1        $2, $f0
/* 0BA708 001BA608 00000000 */  nop
/* 0BA70C 001BA60C 60008046 */  cvt.s.w     $f1, $f0
/* 0BA710 001BA610 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0BA714 001BA614 00008244 */  mtc1        $2, $f0
/* 0BA718 001BA618 00000000 */  nop
/* 0BA71C 001BA61C 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA720 001BA620 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA724 001BA624 00008244 */  mtc1        $2, $f0
/* 0BA728 001BA628 00000000 */  nop
/* 0BA72C 001BA62C 43080046 */  div.s       $f1, $f1, $f0
/* 0BA730 001BA630 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0BA734 001BA634 00008244 */  mtc1        $2, $f0
/* 0BA738 001BA638 00000000 */  nop
/* 0BA73C 001BA63C 01080046 */  sub.s       $f0, $f1, $f0
/* 0BA740 001BA640 21103502 */  addu        $2, $17, $21
/* 0BA744 001BA644 24025624 */  addiu       $22, $2, 0x224
/* 0BA748 001BA648 240240E4 */  swc1        $f0, 0x224($2)
/* 0BA74C 001BA64C BE11040C */  jal         rand
/* 0BA750 001BA650 00000000 */   nop
/* 0BA754 001BA654 00008244 */  mtc1        $2, $f0
/* 0BA758 001BA658 00000000 */  nop
/* 0BA75C 001BA65C 60008046 */  cvt.s.w     $f1, $f0
/* 0BA760 001BA660 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0BA764 001BA664 00008244 */  mtc1        $2, $f0
/* 0BA768 001BA668 00000000 */  nop
/* 0BA76C 001BA66C 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA770 001BA670 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA774 001BA674 00008244 */  mtc1        $2, $f0
/* 0BA778 001BA678 00000000 */  nop
/* 0BA77C 001BA67C 43080046 */  div.s       $f1, $f1, $f0
/* 0BA780 001BA680 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0BA784 001BA684 00008244 */  mtc1        $2, $f0
/* 0BA788 001BA688 00000000 */  nop
/* 0BA78C 001BA68C 01080046 */  sub.s       $f0, $f1, $f0
/* 0BA790 001BA690 21103502 */  addu        $2, $17, $21
/* 0BA794 001BA694 28025224 */  addiu       $18, $2, 0x228
/* 0BA798 001BA698 280240E4 */  swc1        $f0, 0x228($2)
/* 0BA79C 001BA69C 20025324 */  addiu       $19, $2, 0x220
/* 0BA7A0 001BA6A0 A000A427 */  addiu       $4, $29, 0xA0
/* 0BA7A4 001BA6A4 282E6072 */  paddub      $5, $19, $0
/* 0BA7A8 001BA6A8 9285040C */  jal         sceVu0Normalize
/* 0BA7AC 001BA6AC 00000000 */   nop
/* 0BA7B0 001BA6B0 9000A427 */  addiu       $4, $29, 0x90
/* 0BA7B4 001BA6B4 A000A527 */  addiu       $5, $29, 0xA0
/* 0BA7B8 001BA6B8 A005ACC6 */  lwc1        $f12, 0x5A0($21)
/* 0BA7BC 001BA6BC 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 0BA7C0 001BA6C0 00000000 */   nop
/* 0BA7C4 001BA6C4 BE11040C */  jal         rand
/* 0BA7C8 001BA6C8 00000000 */   nop
/* 0BA7CC 001BA6CC 00008244 */  mtc1        $2, $f0
/* 0BA7D0 001BA6D0 00000000 */  nop
/* 0BA7D4 001BA6D4 60008046 */  cvt.s.w     $f1, $f0
/* 0BA7D8 001BA6D8 9000A0C7 */  lwc1        $f0, 0x90($29)
/* 0BA7DC 001BA6DC 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA7E0 001BA6E0 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA7E4 001BA6E4 00008244 */  mtc1        $2, $f0
/* 0BA7E8 001BA6E8 00000000 */  nop
/* 0BA7EC 001BA6EC 83080046 */  div.s       $f2, $f1, $f0
/* 0BA7F0 001BA6F0 000081C6 */  lwc1        $f1, 0x0($20)
/* 0BA7F4 001BA6F4 0000E0C6 */  lwc1        $f0, 0x0($23)
/* 0BA7F8 001BA6F8 00080046 */  add.s       $f0, $f1, $f0
/* 0BA7FC 001BA6FC 00000246 */  add.s       $f0, $f0, $f2
/* 0BA800 001BA700 21103502 */  addu        $2, $17, $21
/* 0BA804 001BA704 200040E4 */  swc1        $f0, 0x20($2)
/* 0BA808 001BA708 BE11040C */  jal         rand
/* 0BA80C 001BA70C 00000000 */   nop
/* 0BA810 001BA710 00008244 */  mtc1        $2, $f0
/* 0BA814 001BA714 00000000 */  nop
/* 0BA818 001BA718 60008046 */  cvt.s.w     $f1, $f0
/* 0BA81C 001BA71C 9400A0C7 */  lwc1        $f0, 0x94($29)
/* 0BA820 001BA720 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA824 001BA724 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA828 001BA728 00008244 */  mtc1        $2, $f0
/* 0BA82C 001BA72C 00000000 */  nop
/* 0BA830 001BA730 83080046 */  div.s       $f2, $f1, $f0
/* 0BA834 001BA734 040081C6 */  lwc1        $f1, 0x4($20)
/* 0BA838 001BA738 0000C0C6 */  lwc1        $f0, 0x0($22)
/* 0BA83C 001BA73C 00080046 */  add.s       $f0, $f1, $f0
/* 0BA840 001BA740 00000246 */  add.s       $f0, $f0, $f2
/* 0BA844 001BA744 21103502 */  addu        $2, $17, $21
/* 0BA848 001BA748 240040E4 */  swc1        $f0, 0x24($2)
/* 0BA84C 001BA74C BE11040C */  jal         rand
/* 0BA850 001BA750 00000000 */   nop
/* 0BA854 001BA754 00008244 */  mtc1        $2, $f0
/* 0BA858 001BA758 00000000 */  nop
/* 0BA85C 001BA75C 60008046 */  cvt.s.w     $f1, $f0
/* 0BA860 001BA760 9800A0C7 */  lwc1        $f0, 0x98($29)
/* 0BA864 001BA764 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA868 001BA768 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA86C 001BA76C 00008244 */  mtc1        $2, $f0
/* 0BA870 001BA770 00000000 */  nop
/* 0BA874 001BA774 83080046 */  div.s       $f2, $f1, $f0
/* 0BA878 001BA778 080081C6 */  lwc1        $f1, 0x8($20)
/* 0BA87C 001BA77C 000040C6 */  lwc1        $f0, 0x0($18)
/* 0BA880 001BA780 00080046 */  add.s       $f0, $f1, $f0
/* 0BA884 001BA784 00000246 */  add.s       $f0, $f0, $f2
/* 0BA888 001BA788 21183502 */  addu        $3, $17, $21
/* 0BA88C 001BA78C 280060E4 */  swc1        $f0, 0x28($3)
/* 0BA890 001BA790 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0BA894 001BA794 2C0062AC */  sw          $2, 0x2C($3)
/* 0BA898 001BA798 BE11040C */  jal         rand
/* 0BA89C 001BA79C 00000000 */   nop
/* 0BA8A0 001BA7A0 00008244 */  mtc1        $2, $f0
/* 0BA8A4 001BA7A4 00000000 */  nop
/* 0BA8A8 001BA7A8 60008046 */  cvt.s.w     $f1, $f0
/* 0BA8AC 001BA7AC 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0BA8B0 001BA7B0 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA8B4 001BA7B4 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA8B8 001BA7B8 00008244 */  mtc1        $2, $f0
/* 0BA8BC 001BA7BC 00000000 */  nop
/* 0BA8C0 001BA7C0 030B0046 */  div.s       $f12, $f1, $f0
/* 0BA8C4 001BA7C4 28266072 */  paddub      $4, $19, $0
/* 0BA8C8 001BA7C8 A000A527 */  addiu       $5, $29, 0xA0
/* 0BA8CC 001BA7CC 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 0BA8D0 001BA7D0 00000000 */   nop
/* 0BA8D4 001BA7D4 BE11040C */  jal         rand
/* 0BA8D8 001BA7D8 00000000 */   nop
/* 0BA8DC 001BA7DC 00008244 */  mtc1        $2, $f0
/* 0BA8E0 001BA7E0 00000000 */  nop
/* 0BA8E4 001BA7E4 60008046 */  cvt.s.w     $f1, $f0
/* 0BA8E8 001BA7E8 2040023C */  lui         $2, (0x40200000 >> 16)
/* 0BA8EC 001BA7EC 00008244 */  mtc1        $2, $f0
/* 0BA8F0 001BA7F0 00000000 */  nop
/* 0BA8F4 001BA7F4 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA8F8 001BA7F8 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA8FC 001BA7FC 00008244 */  mtc1        $2, $f0
/* 0BA900 001BA800 00000000 */  nop
/* 0BA904 001BA804 43080046 */  div.s       $f1, $f1, $f0
/* 0BA908 001BA808 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0BA90C 001BA80C 00008244 */  mtc1        $2, $f0
/* 0BA910 001BA810 00000000 */  nop
/* 0BA914 001BA814 00000146 */  add.s       $f0, $f0, $f1
/* 0BA918 001BA818 80881000 */  sll         $17, $16, 2
/* 0BA91C 001BA81C 21183502 */  addu        $3, $17, $21
/* 0BA920 001BA820 200460E4 */  swc1        $f0, 0x420($3)
/* 0BA924 001BA824 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0BA928 001BA828 A00462AC */  sw          $2, 0x4A0($3)
/* 0BA92C 001BA82C BE11040C */  jal         rand
/* 0BA930 001BA830 00000000 */   nop
/* 0BA934 001BA834 00008244 */  mtc1        $2, $f0
/* 0BA938 001BA838 00000000 */  nop
/* 0BA93C 001BA83C 60008046 */  cvt.s.w     $f1, $f0
/* 0BA940 001BA840 8042023C */  lui         $2, (0x42800000 >> 16)
/* 0BA944 001BA844 00008244 */  mtc1        $2, $f0
/* 0BA948 001BA848 00000000 */  nop
/* 0BA94C 001BA84C 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA950 001BA850 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA954 001BA854 00008244 */  mtc1        $2, $f0
/* 0BA958 001BA858 00000000 */  nop
/* 0BA95C 001BA85C 030B0046 */  div.s       $f12, $f1, $f0
/* 0BA960 001BA860 2C44040C */  jal         fptosi
/* 0BA964 001BA864 00000000 */   nop
/* 0BA968 001BA868 00008244 */  mtc1        $2, $f0
/* 0BA96C 001BA86C 00000000 */  nop
/* 0BA970 001BA870 60008046 */  cvt.s.w     $f1, $f0
/* 0BA974 001BA874 C042033C */  lui         $3, (0x42C00000 >> 16)
/* 0BA978 001BA878 00008344 */  mtc1        $3, $f0
/* 0BA97C 001BA87C 00000000 */  nop
/* 0BA980 001BA880 00000146 */  add.s       $f0, $f0, $f1
/* 0BA984 001BA884 21183502 */  addu        $3, $17, $21
/* 0BA988 001BA888 200560E4 */  swc1        $f0, 0x520($3)
/* 0BA98C 001BA88C 01001026 */  addiu       $16, $16, 0x1
.L001BA890:
/* 0BA990 001BA890 AE05A386 */  lh          $3, 0x5AE($21)
/* 0BA994 001BA894 2A180302 */  slt         $3, $16, $3
/* 0BA998 001BA898 43FF6014 */  bnez        $3, .L001BA5A8
/* 0BA99C 001BA89C 00000000 */   nop
/* 0BA9A0 001BA8A0 28860070 */  paddub      $16, $0, $0
/* 0BA9A4 001BA8A4 4C000010 */  b           .L001BA9D8
/* 0BA9A8 001BA8A8 00000000 */   nop
.L001BA8AC:
/* 0BA9AC 001BA8AC BE11040C */  jal         rand
/* 0BA9B0 001BA8B0 00000000 */   nop
/* 0BA9B4 001BA8B4 00008244 */  mtc1        $2, $f0
/* 0BA9B8 001BA8B8 00000000 */  nop
/* 0BA9BC 001BA8BC 60008046 */  cvt.s.w     $f1, $f0
/* 0BA9C0 001BA8C0 AE05A286 */  lh          $2, 0x5AE($21)
/* 0BA9C4 001BA8C4 00008244 */  mtc1        $2, $f0
/* 0BA9C8 001BA8C8 00000000 */  nop
/* 0BA9CC 001BA8CC 20008046 */  cvt.s.w     $f0, $f0
/* 0BA9D0 001BA8D0 42000146 */  mul.s       $f1, $f0, $f1
/* 0BA9D4 001BA8D4 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BA9D8 001BA8D8 00008244 */  mtc1        $2, $f0
/* 0BA9DC 001BA8DC 00000000 */  nop
/* 0BA9E0 001BA8E0 030B0046 */  div.s       $f12, $f1, $f0
/* 0BA9E4 001BA8E4 2C44040C */  jal         fptosi
/* 0BA9E8 001BA8E8 00000000 */   nop
/* 0BA9EC 001BA8EC 40881000 */  sll         $17, $16, 1
/* 0BA9F0 001BA8F0 21183502 */  addu        $3, $17, $21
/* 0BA9F4 001BA8F4 3C0762A4 */  sh          $2, 0x73C($3)
/* 0BA9F8 001BA8F8 BE11040C */  jal         rand
/* 0BA9FC 001BA8FC 00000000 */   nop
/* 0BAA00 001BA900 00008244 */  mtc1        $2, $f0
/* 0BAA04 001BA904 00000000 */  nop
/* 0BAA08 001BA908 60008046 */  cvt.s.w     $f1, $f0
/* 0BAA0C 001BA90C AE05A286 */  lh          $2, 0x5AE($21)
/* 0BAA10 001BA910 00008244 */  mtc1        $2, $f0
/* 0BAA14 001BA914 00000000 */  nop
/* 0BAA18 001BA918 20008046 */  cvt.s.w     $f0, $f0
/* 0BAA1C 001BA91C 42000146 */  mul.s       $f1, $f0, $f1
/* 0BAA20 001BA920 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BAA24 001BA924 00008244 */  mtc1        $2, $f0
/* 0BAA28 001BA928 00000000 */  nop
/* 0BAA2C 001BA92C 030B0046 */  div.s       $f12, $f1, $f0
/* 0BAA30 001BA930 2C44040C */  jal         fptosi
/* 0BAA34 001BA934 00000000 */   nop
/* 0BAA38 001BA938 21183502 */  addu        $3, $17, $21
/* 0BAA3C 001BA93C 5C0762A4 */  sh          $2, 0x75C($3)
/* 0BAA40 001BA940 BE11040C */  jal         rand
/* 0BAA44 001BA944 00000000 */   nop
/* 0BAA48 001BA948 00008244 */  mtc1        $2, $f0
/* 0BAA4C 001BA94C 00000000 */  nop
/* 0BAA50 001BA950 60008046 */  cvt.s.w     $f1, $f0
/* 0BAA54 001BA954 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0BAA58 001BA958 00008244 */  mtc1        $2, $f0
/* 0BAA5C 001BA95C 00000000 */  nop
/* 0BAA60 001BA960 42000146 */  mul.s       $f1, $f0, $f1
/* 0BAA64 001BA964 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BAA68 001BA968 00008244 */  mtc1        $2, $f0
/* 0BAA6C 001BA96C 00000000 */  nop
/* 0BAA70 001BA970 030B0046 */  div.s       $f12, $f1, $f0
/* 0BAA74 001BA974 2C44040C */  jal         fptosi
/* 0BAA78 001BA978 00000000 */   nop
/* 0BAA7C 001BA97C 40180200 */  sll         $3, $2, 1
/* 0BAA80 001BA980 21106200 */  addu        $2, $3, $2
/* 0BAA84 001BA984 03004324 */  addiu       $3, $2, 0x3
/* 0BAA88 001BA988 21103502 */  addu        $2, $17, $21
/* 0BAA8C 001BA98C 7C0743A4 */  sh          $3, 0x77C($2)
/* 0BAA90 001BA990 BE11040C */  jal         rand
/* 0BAA94 001BA994 00000000 */   nop
/* 0BAA98 001BA998 00008244 */  mtc1        $2, $f0
/* 0BAA9C 001BA99C 00000000 */  nop
/* 0BAAA0 001BA9A0 60008046 */  cvt.s.w     $f1, $f0
/* 0BAAA4 001BA9A4 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0BAAA8 001BA9A8 00008244 */  mtc1        $2, $f0
/* 0BAAAC 001BA9AC 00000000 */  nop
/* 0BAAB0 001BA9B0 42000146 */  mul.s       $f1, $f0, $f1
/* 0BAAB4 001BA9B4 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BAAB8 001BA9B8 00008244 */  mtc1        $2, $f0
/* 0BAABC 001BA9BC 00000000 */  nop
/* 0BAAC0 001BA9C0 030B0046 */  div.s       $f12, $f1, $f0
/* 0BAAC4 001BA9C4 2C44040C */  jal         fptosi
/* 0BAAC8 001BA9C8 00000000 */   nop
/* 0BAACC 001BA9CC 21183502 */  addu        $3, $17, $21
/* 0BAAD0 001BA9D0 9C0762A4 */  sh          $2, 0x79C($3)
/* 0BAAD4 001BA9D4 01001026 */  addiu       $16, $16, 0x1
.L001BA9D8:
/* 0BAAD8 001BA9D8 BC07A386 */  lh          $3, 0x7BC($21)
/* 0BAADC 001BA9DC 2A180302 */  slt         $3, $16, $3
/* 0BAAE0 001BA9E0 B2FF6014 */  bnez        $3, .L001BA8AC
/* 0BAAE4 001BA9E4 00000000 */   nop
/* 0BAAE8 001BA9E8 8000BF7B */  lq          $31, 0x80($29)
/* 0BAAEC 001BA9EC 7000B77B */  lq          $23, 0x70($29)
/* 0BAAF0 001BA9F0 6000B67B */  lq          $22, 0x60($29)
/* 0BAAF4 001BA9F4 5000B57B */  lq          $21, 0x50($29)
/* 0BAAF8 001BA9F8 4000B47B */  lq          $20, 0x40($29)
/* 0BAAFC 001BA9FC 3000B37B */  lq          $19, 0x30($29)
/* 0BAB00 001BAA00 2000B27B */  lq          $18, 0x20($29)
/* 0BAB04 001BAA04 1000B17B */  lq          $17, 0x10($29)
/* 0BAB08 001BAA08 0000B07B */  lq          $16, 0x0($29)
/* 0BAB0C 001BAA0C B000BD27 */  addiu       $29, $29, 0xB0
/* 0BAB10 001BAA10 0800E003 */  jr          $31
/* 0BAB14 001BAA14 00000000 */   nop
/* 0BAB18 001BAA18 00000000 */  nop
/* 0BAB1C 001BAA1C 00000000 */  nop
