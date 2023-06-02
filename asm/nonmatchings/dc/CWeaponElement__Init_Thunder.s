.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Init_Thunder__14CWeaponElementFPf
/* BA5F0 001BA4F0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* BA5F4 001BA4F4 8000BF7F */  sq         $31, 0x80($sp)
/* BA5F8 001BA4F8 7000B77F */  sq         $23, 0x70($sp)
/* BA5FC 001BA4FC 6000B67F */  sq         $22, 0x60($sp)
/* BA600 001BA500 5000B57F */  sq         $21, 0x50($sp)
/* BA604 001BA504 4000B47F */  sq         $20, 0x40($sp)
/* BA608 001BA508 3000B37F */  sq         $19, 0x30($sp)
/* BA60C 001BA50C 2000B27F */  sq         $18, 0x20($sp)
/* BA610 001BA510 1000B17F */  sq         $17, 0x10($sp)
/* BA614 001BA514 0000B07F */  sq         $16, 0x0($sp)
/* BA618 001BA518 28AE8070 */  paddub     $21, $4, $0
/* BA61C 001BA51C 28A6A070 */  paddub     $20, $5, $0
/* BA620 001BA520 9041023C */  lui        $2, (0x41900000 >> 16)
/* BA624 001BA524 00088244 */  mtc1       $2, $f1
/* BA628 001BA528 A80580C4 */  lwc1       $f0, 0x5A8($4)
/* BA62C 001BA52C 020B0046 */  mul.s      $f12, $f1, $f0
/* BA630 001BA530 2C44040C */  jal        fptosi
/* BA634 001BA534 00000000 */   nop
/* BA638 001BA538 06004224 */  addiu      $2, $2, 0x6
/* BA63C 001BA53C AE05A2A6 */  sh         $2, 0x5AE($21)
/* BA640 001BA540 E040023C */  lui        $2, (0x40E00000 >> 16)
/* BA644 001BA544 00088244 */  mtc1       $2, $f1
/* BA648 001BA548 A805A0C6 */  lwc1       $f0, 0x5A8($21)
/* BA64C 001BA54C 020B0046 */  mul.s      $f12, $f1, $f0
/* BA650 001BA550 2C44040C */  jal        fptosi
/* BA654 001BA554 00000000 */   nop
/* BA658 001BA558 01004224 */  addiu      $2, $2, 0x1
/* BA65C 001BA55C BC07A2A6 */  sh         $2, 0x7BC($21)
/* BA660 001BA560 6C8381C7 */  lwc1       $f1, -0x7C94($gp)
/* BA664 001BA564 A805A0C6 */  lwc1       $f0, 0x5A8($21)
/* BA668 001BA568 020B0046 */  mul.s      $f12, $f1, $f0
/* BA66C 001BA56C 9044040C */  jal        fptodp
/* BA670 001BA570 00000000 */   nop
/* BA674 001BA574 688084DF */  ld         $4, -0x7F98($gp)
/* BA678 001BA578 282E4070 */  paddub     $5, $2, $0
/* BA67C 001BA57C 6E3F040C */  jal        dpadd
/* BA680 001BA580 00000000 */   nop
/* BA684 001BA584 28264070 */  paddub     $4, $2, $0
/* BA688 001BA588 9241040C */  jal        dptofp
/* BA68C 001BA58C 00000000 */   nop
/* BA690 001BA590 A005A1C6 */  lwc1       $f1, 0x5A0($21)
/* BA694 001BA594 02080046 */  mul.s      $f0, $f1, $f0
/* BA698 001BA598 A005A0E6 */  swc1       $f0, 0x5A0($21)
/* BA69C 001BA59C 28860070 */  paddub     $16, $0, $0
/* BA6A0 001BA5A0 BB000010 */  b          .L001BA890
/* BA6A4 001BA5A4 00000000 */   nop
.L001BA5A8:
/* BA6A8 001BA5A8 BE11040C */  jal        rand
/* BA6AC 001BA5AC 00000000 */   nop
/* BA6B0 001BA5B0 00008244 */  mtc1       $2, $f0
/* BA6B4 001BA5B4 00000000 */  nop
/* BA6B8 001BA5B8 60008046 */  cvt.s.w    $f1, $f0
/* BA6BC 001BA5BC 0041023C */  lui        $2, (0x41000000 >> 16)
/* BA6C0 001BA5C0 00008244 */  mtc1       $2, $f0
/* BA6C4 001BA5C4 00000000 */  nop
/* BA6C8 001BA5C8 42000146 */  mul.s      $f1, $f0, $f1
/* BA6CC 001BA5CC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA6D0 001BA5D0 00008244 */  mtc1       $2, $f0
/* BA6D4 001BA5D4 00000000 */  nop
/* BA6D8 001BA5D8 43080046 */  div.s      $f1, $f1, $f0
/* BA6DC 001BA5DC 8040023C */  lui        $2, (0x40800000 >> 16)
/* BA6E0 001BA5E0 00008244 */  mtc1       $2, $f0
/* BA6E4 001BA5E4 00000000 */  nop
/* BA6E8 001BA5E8 01080046 */  sub.s      $f0, $f1, $f0
/* BA6EC 001BA5EC 00891000 */  sll        $17, $16, 4
/* BA6F0 001BA5F0 21103502 */  addu       $2, $17, $21
/* BA6F4 001BA5F4 20025724 */  addiu      $23, $2, 0x220
/* BA6F8 001BA5F8 200240E4 */  swc1       $f0, 0x220($2)
/* BA6FC 001BA5FC BE11040C */  jal        rand
/* BA700 001BA600 00000000 */   nop
/* BA704 001BA604 00008244 */  mtc1       $2, $f0
/* BA708 001BA608 00000000 */  nop
/* BA70C 001BA60C 60008046 */  cvt.s.w    $f1, $f0
/* BA710 001BA610 8040023C */  lui        $2, (0x40800000 >> 16)
/* BA714 001BA614 00008244 */  mtc1       $2, $f0
/* BA718 001BA618 00000000 */  nop
/* BA71C 001BA61C 42000146 */  mul.s      $f1, $f0, $f1
/* BA720 001BA620 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA724 001BA624 00008244 */  mtc1       $2, $f0
/* BA728 001BA628 00000000 */  nop
/* BA72C 001BA62C 43080046 */  div.s      $f1, $f1, $f0
/* BA730 001BA630 0040023C */  lui        $2, (0x40000000 >> 16)
/* BA734 001BA634 00008244 */  mtc1       $2, $f0
/* BA738 001BA638 00000000 */  nop
/* BA73C 001BA63C 01080046 */  sub.s      $f0, $f1, $f0
/* BA740 001BA640 21103502 */  addu       $2, $17, $21
/* BA744 001BA644 24025624 */  addiu      $22, $2, 0x224
/* BA748 001BA648 240240E4 */  swc1       $f0, 0x224($2)
/* BA74C 001BA64C BE11040C */  jal        rand
/* BA750 001BA650 00000000 */   nop
/* BA754 001BA654 00008244 */  mtc1       $2, $f0
/* BA758 001BA658 00000000 */  nop
/* BA75C 001BA65C 60008046 */  cvt.s.w    $f1, $f0
/* BA760 001BA660 0041023C */  lui        $2, (0x41000000 >> 16)
/* BA764 001BA664 00008244 */  mtc1       $2, $f0
/* BA768 001BA668 00000000 */  nop
/* BA76C 001BA66C 42000146 */  mul.s      $f1, $f0, $f1
/* BA770 001BA670 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA774 001BA674 00008244 */  mtc1       $2, $f0
/* BA778 001BA678 00000000 */  nop
/* BA77C 001BA67C 43080046 */  div.s      $f1, $f1, $f0
/* BA780 001BA680 8040023C */  lui        $2, (0x40800000 >> 16)
/* BA784 001BA684 00008244 */  mtc1       $2, $f0
/* BA788 001BA688 00000000 */  nop
/* BA78C 001BA68C 01080046 */  sub.s      $f0, $f1, $f0
/* BA790 001BA690 21103502 */  addu       $2, $17, $21
/* BA794 001BA694 28025224 */  addiu      $18, $2, 0x228
/* BA798 001BA698 280240E4 */  swc1       $f0, 0x228($2)
/* BA79C 001BA69C 20025324 */  addiu      $19, $2, 0x220
/* BA7A0 001BA6A0 A000A427 */  addiu      $4, $sp, 0xA0
/* BA7A4 001BA6A4 282E6072 */  paddub     $5, $19, $0
/* BA7A8 001BA6A8 9285040C */  jal        sceVu0Normalize
/* BA7AC 001BA6AC 00000000 */   nop
/* BA7B0 001BA6B0 9000A427 */  addiu      $4, $sp, 0x90
/* BA7B4 001BA6B4 A000A527 */  addiu      $5, $sp, 0xA0
/* BA7B8 001BA6B8 A005ACC6 */  lwc1       $f12, 0x5A0($21)
/* BA7BC 001BA6BC 4688040C */  jal        sceVu0ScaleVectorXYZ
/* BA7C0 001BA6C0 00000000 */   nop
/* BA7C4 001BA6C4 BE11040C */  jal        rand
/* BA7C8 001BA6C8 00000000 */   nop
/* BA7CC 001BA6CC 00008244 */  mtc1       $2, $f0
/* BA7D0 001BA6D0 00000000 */  nop
/* BA7D4 001BA6D4 60008046 */  cvt.s.w    $f1, $f0
/* BA7D8 001BA6D8 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* BA7DC 001BA6DC 42000146 */  mul.s      $f1, $f0, $f1
/* BA7E0 001BA6E0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA7E4 001BA6E4 00008244 */  mtc1       $2, $f0
/* BA7E8 001BA6E8 00000000 */  nop
/* BA7EC 001BA6EC 83080046 */  div.s      $f2, $f1, $f0
/* BA7F0 001BA6F0 000081C6 */  lwc1       $f1, 0x0($20)
/* BA7F4 001BA6F4 0000E0C6 */  lwc1       $f0, 0x0($23)
/* BA7F8 001BA6F8 00080046 */  add.s      $f0, $f1, $f0
/* BA7FC 001BA6FC 00000246 */  add.s      $f0, $f0, $f2
/* BA800 001BA700 21103502 */  addu       $2, $17, $21
/* BA804 001BA704 200040E4 */  swc1       $f0, 0x20($2)
/* BA808 001BA708 BE11040C */  jal        rand
/* BA80C 001BA70C 00000000 */   nop
/* BA810 001BA710 00008244 */  mtc1       $2, $f0
/* BA814 001BA714 00000000 */  nop
/* BA818 001BA718 60008046 */  cvt.s.w    $f1, $f0
/* BA81C 001BA71C 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* BA820 001BA720 42000146 */  mul.s      $f1, $f0, $f1
/* BA824 001BA724 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA828 001BA728 00008244 */  mtc1       $2, $f0
/* BA82C 001BA72C 00000000 */  nop
/* BA830 001BA730 83080046 */  div.s      $f2, $f1, $f0
/* BA834 001BA734 040081C6 */  lwc1       $f1, 0x4($20)
/* BA838 001BA738 0000C0C6 */  lwc1       $f0, 0x0($22)
/* BA83C 001BA73C 00080046 */  add.s      $f0, $f1, $f0
/* BA840 001BA740 00000246 */  add.s      $f0, $f0, $f2
/* BA844 001BA744 21103502 */  addu       $2, $17, $21
/* BA848 001BA748 240040E4 */  swc1       $f0, 0x24($2)
/* BA84C 001BA74C BE11040C */  jal        rand
/* BA850 001BA750 00000000 */   nop
/* BA854 001BA754 00008244 */  mtc1       $2, $f0
/* BA858 001BA758 00000000 */  nop
/* BA85C 001BA75C 60008046 */  cvt.s.w    $f1, $f0
/* BA860 001BA760 9800A0C7 */  lwc1       $f0, 0x98($sp)
/* BA864 001BA764 42000146 */  mul.s      $f1, $f0, $f1
/* BA868 001BA768 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA86C 001BA76C 00008244 */  mtc1       $2, $f0
/* BA870 001BA770 00000000 */  nop
/* BA874 001BA774 83080046 */  div.s      $f2, $f1, $f0
/* BA878 001BA778 080081C6 */  lwc1       $f1, 0x8($20)
/* BA87C 001BA77C 000040C6 */  lwc1       $f0, 0x0($18)
/* BA880 001BA780 00080046 */  add.s      $f0, $f1, $f0
/* BA884 001BA784 00000246 */  add.s      $f0, $f0, $f2
/* BA888 001BA788 21183502 */  addu       $3, $17, $21
/* BA88C 001BA78C 280060E4 */  swc1       $f0, 0x28($3)
/* BA890 001BA790 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BA894 001BA794 2C0062AC */  sw         $2, 0x2C($3)
/* BA898 001BA798 BE11040C */  jal        rand
/* BA89C 001BA79C 00000000 */   nop
/* BA8A0 001BA7A0 00008244 */  mtc1       $2, $f0
/* BA8A4 001BA7A4 00000000 */  nop
/* BA8A8 001BA7A8 60008046 */  cvt.s.w    $f1, $f0
/* BA8AC 001BA7AC 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* BA8B0 001BA7B0 42000146 */  mul.s      $f1, $f0, $f1
/* BA8B4 001BA7B4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA8B8 001BA7B8 00008244 */  mtc1       $2, $f0
/* BA8BC 001BA7BC 00000000 */  nop
/* BA8C0 001BA7C0 030B0046 */  div.s      $f12, $f1, $f0
/* BA8C4 001BA7C4 28266072 */  paddub     $4, $19, $0
/* BA8C8 001BA7C8 A000A527 */  addiu      $5, $sp, 0xA0
/* BA8CC 001BA7CC 4688040C */  jal        sceVu0ScaleVectorXYZ
/* BA8D0 001BA7D0 00000000 */   nop
/* BA8D4 001BA7D4 BE11040C */  jal        rand
/* BA8D8 001BA7D8 00000000 */   nop
/* BA8DC 001BA7DC 00008244 */  mtc1       $2, $f0
/* BA8E0 001BA7E0 00000000 */  nop
/* BA8E4 001BA7E4 60008046 */  cvt.s.w    $f1, $f0
/* BA8E8 001BA7E8 2040023C */  lui        $2, (0x40200000 >> 16)
/* BA8EC 001BA7EC 00008244 */  mtc1       $2, $f0
/* BA8F0 001BA7F0 00000000 */  nop
/* BA8F4 001BA7F4 42000146 */  mul.s      $f1, $f0, $f1
/* BA8F8 001BA7F8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA8FC 001BA7FC 00008244 */  mtc1       $2, $f0
/* BA900 001BA800 00000000 */  nop
/* BA904 001BA804 43080046 */  div.s      $f1, $f1, $f0
/* BA908 001BA808 003F023C */  lui        $2, (0x3F000000 >> 16)
/* BA90C 001BA80C 00008244 */  mtc1       $2, $f0
/* BA910 001BA810 00000000 */  nop
/* BA914 001BA814 00000146 */  add.s      $f0, $f0, $f1
/* BA918 001BA818 80881000 */  sll        $17, $16, 2
/* BA91C 001BA81C 21183502 */  addu       $3, $17, $21
/* BA920 001BA820 200460E4 */  swc1       $f0, 0x420($3)
/* BA924 001BA824 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BA928 001BA828 A00462AC */  sw         $2, 0x4A0($3)
/* BA92C 001BA82C BE11040C */  jal        rand
/* BA930 001BA830 00000000 */   nop
/* BA934 001BA834 00008244 */  mtc1       $2, $f0
/* BA938 001BA838 00000000 */  nop
/* BA93C 001BA83C 60008046 */  cvt.s.w    $f1, $f0
/* BA940 001BA840 8042023C */  lui        $2, (0x42800000 >> 16)
/* BA944 001BA844 00008244 */  mtc1       $2, $f0
/* BA948 001BA848 00000000 */  nop
/* BA94C 001BA84C 42000146 */  mul.s      $f1, $f0, $f1
/* BA950 001BA850 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA954 001BA854 00008244 */  mtc1       $2, $f0
/* BA958 001BA858 00000000 */  nop
/* BA95C 001BA85C 030B0046 */  div.s      $f12, $f1, $f0
/* BA960 001BA860 2C44040C */  jal        fptosi
/* BA964 001BA864 00000000 */   nop
/* BA968 001BA868 00008244 */  mtc1       $2, $f0
/* BA96C 001BA86C 00000000 */  nop
/* BA970 001BA870 60008046 */  cvt.s.w    $f1, $f0
/* BA974 001BA874 C042033C */  lui        $3, (0x42C00000 >> 16)
/* BA978 001BA878 00008344 */  mtc1       $3, $f0
/* BA97C 001BA87C 00000000 */  nop
/* BA980 001BA880 00000146 */  add.s      $f0, $f0, $f1
/* BA984 001BA884 21183502 */  addu       $3, $17, $21
/* BA988 001BA888 200560E4 */  swc1       $f0, 0x520($3)
/* BA98C 001BA88C 01001026 */  addiu      $16, $16, 0x1
.L001BA890:
/* BA990 001BA890 AE05A386 */  lh         $3, 0x5AE($21)
/* BA994 001BA894 2A180302 */  slt        $3, $16, $3
/* BA998 001BA898 43FF6014 */  bnez       $3, .L001BA5A8
/* BA99C 001BA89C 00000000 */   nop
/* BA9A0 001BA8A0 28860070 */  paddub     $16, $0, $0
/* BA9A4 001BA8A4 4C000010 */  b          .L001BA9D8
/* BA9A8 001BA8A8 00000000 */   nop
.L001BA8AC:
/* BA9AC 001BA8AC BE11040C */  jal        rand
/* BA9B0 001BA8B0 00000000 */   nop
/* BA9B4 001BA8B4 00008244 */  mtc1       $2, $f0
/* BA9B8 001BA8B8 00000000 */  nop
/* BA9BC 001BA8BC 60008046 */  cvt.s.w    $f1, $f0
/* BA9C0 001BA8C0 AE05A286 */  lh         $2, 0x5AE($21)
/* BA9C4 001BA8C4 00008244 */  mtc1       $2, $f0
/* BA9C8 001BA8C8 00000000 */  nop
/* BA9CC 001BA8CC 20008046 */  cvt.s.w    $f0, $f0
/* BA9D0 001BA8D0 42000146 */  mul.s      $f1, $f0, $f1
/* BA9D4 001BA8D4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BA9D8 001BA8D8 00008244 */  mtc1       $2, $f0
/* BA9DC 001BA8DC 00000000 */  nop
/* BA9E0 001BA8E0 030B0046 */  div.s      $f12, $f1, $f0
/* BA9E4 001BA8E4 2C44040C */  jal        fptosi
/* BA9E8 001BA8E8 00000000 */   nop
/* BA9EC 001BA8EC 40881000 */  sll        $17, $16, 1
/* BA9F0 001BA8F0 21183502 */  addu       $3, $17, $21
/* BA9F4 001BA8F4 3C0762A4 */  sh         $2, 0x73C($3)
/* BA9F8 001BA8F8 BE11040C */  jal        rand
/* BA9FC 001BA8FC 00000000 */   nop
/* BAA00 001BA900 00008244 */  mtc1       $2, $f0
/* BAA04 001BA904 00000000 */  nop
/* BAA08 001BA908 60008046 */  cvt.s.w    $f1, $f0
/* BAA0C 001BA90C AE05A286 */  lh         $2, 0x5AE($21)
/* BAA10 001BA910 00008244 */  mtc1       $2, $f0
/* BAA14 001BA914 00000000 */  nop
/* BAA18 001BA918 20008046 */  cvt.s.w    $f0, $f0
/* BAA1C 001BA91C 42000146 */  mul.s      $f1, $f0, $f1
/* BAA20 001BA920 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BAA24 001BA924 00008244 */  mtc1       $2, $f0
/* BAA28 001BA928 00000000 */  nop
/* BAA2C 001BA92C 030B0046 */  div.s      $f12, $f1, $f0
/* BAA30 001BA930 2C44040C */  jal        fptosi
/* BAA34 001BA934 00000000 */   nop
/* BAA38 001BA938 21183502 */  addu       $3, $17, $21
/* BAA3C 001BA93C 5C0762A4 */  sh         $2, 0x75C($3)
/* BAA40 001BA940 BE11040C */  jal        rand
/* BAA44 001BA944 00000000 */   nop
/* BAA48 001BA948 00008244 */  mtc1       $2, $f0
/* BAA4C 001BA94C 00000000 */  nop
/* BAA50 001BA950 60008046 */  cvt.s.w    $f1, $f0
/* BAA54 001BA954 C040023C */  lui        $2, (0x40C00000 >> 16)
/* BAA58 001BA958 00008244 */  mtc1       $2, $f0
/* BAA5C 001BA95C 00000000 */  nop
/* BAA60 001BA960 42000146 */  mul.s      $f1, $f0, $f1
/* BAA64 001BA964 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BAA68 001BA968 00008244 */  mtc1       $2, $f0
/* BAA6C 001BA96C 00000000 */  nop
/* BAA70 001BA970 030B0046 */  div.s      $f12, $f1, $f0
/* BAA74 001BA974 2C44040C */  jal        fptosi
/* BAA78 001BA978 00000000 */   nop
/* BAA7C 001BA97C 40180200 */  sll        $3, $2, 1
/* BAA80 001BA980 21106200 */  addu       $2, $3, $2
/* BAA84 001BA984 03004324 */  addiu      $3, $2, 0x3
/* BAA88 001BA988 21103502 */  addu       $2, $17, $21
/* BAA8C 001BA98C 7C0743A4 */  sh         $3, 0x77C($2)
/* BAA90 001BA990 BE11040C */  jal        rand
/* BAA94 001BA994 00000000 */   nop
/* BAA98 001BA998 00008244 */  mtc1       $2, $f0
/* BAA9C 001BA99C 00000000 */  nop
/* BAAA0 001BA9A0 60008046 */  cvt.s.w    $f1, $f0
/* BAAA4 001BA9A4 8040023C */  lui        $2, (0x40800000 >> 16)
/* BAAA8 001BA9A8 00008244 */  mtc1       $2, $f0
/* BAAAC 001BA9AC 00000000 */  nop
/* BAAB0 001BA9B0 42000146 */  mul.s      $f1, $f0, $f1
/* BAAB4 001BA9B4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BAAB8 001BA9B8 00008244 */  mtc1       $2, $f0
/* BAABC 001BA9BC 00000000 */  nop
/* BAAC0 001BA9C0 030B0046 */  div.s      $f12, $f1, $f0
/* BAAC4 001BA9C4 2C44040C */  jal        fptosi
/* BAAC8 001BA9C8 00000000 */   nop
/* BAACC 001BA9CC 21183502 */  addu       $3, $17, $21
/* BAAD0 001BA9D0 9C0762A4 */  sh         $2, 0x79C($3)
/* BAAD4 001BA9D4 01001026 */  addiu      $16, $16, 0x1
.L001BA9D8:
/* BAAD8 001BA9D8 BC07A386 */  lh         $3, 0x7BC($21)
/* BAADC 001BA9DC 2A180302 */  slt        $3, $16, $3
/* BAAE0 001BA9E0 B2FF6014 */  bnez       $3, .L001BA8AC
/* BAAE4 001BA9E4 00000000 */   nop
/* BAAE8 001BA9E8 8000BF7B */  lq         $31, 0x80($sp)
/* BAAEC 001BA9EC 7000B77B */  lq         $23, 0x70($sp)
/* BAAF0 001BA9F0 6000B67B */  lq         $22, 0x60($sp)
/* BAAF4 001BA9F4 5000B57B */  lq         $21, 0x50($sp)
/* BAAF8 001BA9F8 4000B47B */  lq         $20, 0x40($sp)
/* BAAFC 001BA9FC 3000B37B */  lq         $19, 0x30($sp)
/* BAB00 001BAA00 2000B27B */  lq         $18, 0x20($sp)
/* BAB04 001BAA04 1000B17B */  lq         $17, 0x10($sp)
/* BAB08 001BAA08 0000B07B */  lq         $16, 0x0($sp)
/* BAB0C 001BAA0C B000BD27 */  addiu      $sp, $sp, 0xB0
/* BAB10 001BAA10 0800E003 */  jr         $31
/* BAB14 001BAA14 00000000 */   nop
/* BAB18 001BAA18 00000000 */  nop
/* BAB1C 001BAA1C 00000000 */  nop
