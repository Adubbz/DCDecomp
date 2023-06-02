.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FireStep__9CFireOmniFv
/* 617F0 001616F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 617F4 001616F4 1000BF7F */  sq         $31, 0x10($sp)
/* 617F8 001616F8 0000B07F */  sq         $16, 0x0($sp)
/* 617FC 001616FC 28868070 */  paddub     $16, $4, $0
/* 61800 00161700 0C0081C4 */  lwc1       $f1, 0xC($4)
/* 61804 00161704 D48180C7 */  lwc1       $f0, -0x7E2C($gp)
/* 61808 00161708 41080046 */  sub.s      $f1, $f1, $f0
/* 6180C 0016170C 0C0081E4 */  swc1       $f1, 0xC($4)
/* 61810 00161710 00008044 */  mtc1       $0, $f0
/* 61814 00161714 00000000 */  nop
/* 61818 00161718 36080046 */  c.le.s     $f1, $f0
/* 6181C 0016171C 00000000 */  nop
/* 61820 00161720 03000045 */  bc1f       .L00161730
/* 61824 00161724 00000000 */   nop
/* 61828 00161728 E88180C7 */  lwc1       $f0, -0x7E18($gp)
/* 6182C 0016172C 0C0000E6 */  swc1       $f0, 0xC($16)
.L00161730:
/* 61830 00161730 080001C6 */  lwc1       $f1, 0x8($16)
/* 61834 00161734 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 61838 00161738 00008244 */  mtc1       $2, $f0
/* 6183C 0016173C 00000000 */  nop
/* 61840 00161740 40080046 */  add.s      $f1, $f1, $f0
/* 61844 00161744 080001E6 */  swc1       $f1, 0x8($16)
/* 61848 00161748 0043023C */  lui        $2, (0x43000000 >> 16)
/* 6184C 0016174C 00008244 */  mtc1       $2, $f0
/* 61850 00161750 00000000 */  nop
/* 61854 00161754 34080046 */  c.lt.s     $f1, $f0
/* 61858 00161758 00000000 */  nop
/* 6185C 0016175C 02000145 */  bc1t       .L00161768
/* 61860 00161760 00000000 */   nop
/* 61864 00161764 080000AE */  sw         $0, 0x8($16)
.L00161768:
/* 61868 00161768 BE11040C */  jal        rand
/* 6186C 0016176C 00000000 */   nop
/* 61870 00161770 00008244 */  mtc1       $2, $f0
/* 61874 00161774 00000000 */  nop
/* 61878 00161778 60008046 */  cvt.s.w    $f1, $f0
/* 6187C 0016177C 60EA0234 */  ori        $2, $0, 0xEA60
/* 61880 00161780 00008244 */  mtc1       $2, $f0
/* 61884 00161784 00000000 */  nop
/* 61888 00161788 20008046 */  cvt.s.w    $f0, $f0
/* 6188C 0016178C 42000146 */  mul.s      $f1, $f0, $f1
/* 61890 00161790 004F023C */  lui        $2, (0x4F000000 >> 16)
/* 61894 00161794 00008244 */  mtc1       $2, $f0
/* 61898 00161798 00000000 */  nop
/* 6189C 0016179C 030B0046 */  div.s      $f12, $f1, $f0
/* 618A0 001617A0 2C44040C */  jal        fptosi
/* 618A4 001617A4 00000000 */   nop
/* 618A8 001617A8 180002A6 */  sh         $2, 0x18($16)
/* 618AC 001617AC 1000BF7B */  lq         $31, 0x10($sp)
/* 618B0 001617B0 0000B07B */  lq         $16, 0x0($sp)
/* 618B4 001617B4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 618B8 001617B8 0800E003 */  jr         $31
/* 618BC 001617BC 00000000 */   nop