.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckHealZone__Fv
/* AF7E0 001AF6E0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* AF7E4 001AF6E4 4000BF7F */  sq         $31, 0x40($sp)
/* AF7E8 001AF6E8 3000B37F */  sq         $19, 0x30($sp)
/* AF7EC 001AF6EC 2000B27F */  sq         $18, 0x20($sp)
/* AF7F0 001AF6F0 1000B17F */  sq         $17, 0x10($sp)
/* AF7F4 001AF6F4 0000B07F */  sq         $16, 0x0($sp)
/* AF7F8 001AF6F8 5000A427 */  addiu      $4, $sp, 0x50
/* AF7FC 001AF6FC EA01023C */  lui        $2, %hi(D_1EA1D30)
/* AF800 001AF700 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* AF804 001AF704 0C86040C */  jal        sceVu0CopyVector
/* AF808 001AF708 00000000 */   nop
/* AF80C 001AF70C DC01013C */  lui        $at, (0x1DC4514 >> 16)
/* AF810 001AF710 144520A4 */  sh         $0, (0x1DC4514 & 0xFFFF)($at)
/* AF814 001AF714 A042023C */  lui        $2, (0x42A00000 >> 16)
/* AF818 001AF718 00088244 */  mtc1       $2, $f1
/* AF81C 001AF71C 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* AF820 001AF720 40080046 */  add.s      $f1, $f1, $f0
/* AF824 001AF724 2043023C */  lui        $2, (0x43200000 >> 16)
/* AF828 001AF728 00008244 */  mtc1       $2, $f0
/* AF82C 001AF72C 00000000 */  nop
/* AF830 001AF730 030B0046 */  div.s      $f12, $f1, $f0
/* AF834 001AF734 2C44040C */  jal        fptosi
/* AF838 001AF738 00000000 */   nop
/* AF83C 001AF73C 28864070 */  paddub     $16, $2, $0
/* AF840 001AF740 A042023C */  lui        $2, (0x42A00000 >> 16)
/* AF844 001AF744 00088244 */  mtc1       $2, $f1
/* AF848 001AF748 5800B327 */  addiu      $19, $sp, 0x58
/* AF84C 001AF74C 000060C6 */  lwc1       $f0, 0x0($19)
/* AF850 001AF750 40080046 */  add.s      $f1, $f1, $f0
/* AF854 001AF754 2043023C */  lui        $2, (0x43200000 >> 16)
/* AF858 001AF758 00008244 */  mtc1       $2, $f0
/* AF85C 001AF75C 00000000 */  nop
/* AF860 001AF760 030B0046 */  div.s      $f12, $f1, $f0
/* AF864 001AF764 2C44040C */  jal        fptosi
/* AF868 001AF768 00000000 */   nop
/* AF86C 001AF76C 288E4070 */  paddub     $17, $2, $0
/* AF870 001AF770 80180200 */  sll        $3, $2, 2
/* AF874 001AF774 21106200 */  addu       $2, $3, $2
/* AF878 001AF778 80100200 */  sll        $2, $2, 2
/* AF87C 001AF77C 21100202 */  addu       $2, $16, $2
/* AF880 001AF780 00110200 */  sll        $2, $2, 4
/* AF884 001AF784 C89C848F */  lw         $4, -0x6338($gp)
/* AF888 001AF788 21104400 */  addu       $2, $2, $4
/* AF88C 001AF78C 0100013C */  lui        $at, (0x10000 >> 16)
/* AF890 001AF790 21084100 */  addu       $at, $2, $at
/* AF894 001AF794 509C238C */  lw         $3, -0x63B0($at)
/* AF898 001AF798 FFFF0224 */  addiu      $2, $0, -0x1
/* AF89C 001AF79C 04006214 */  bne        $3, $2, .L001AF7B0
/* AF8A0 001AF7A0 00000000 */   nop
/* AF8A4 001AF7A4 28160070 */  paddub     $2, $0, $0
/* AF8A8 001AF7A8 6C000010 */  b          .L001AF95C
/* AF8AC 001AF7AC 00000000 */   nop
.L001AF7B0:
/* AF8B0 001AF7B0 C0100300 */  sll        $2, $3, 3
/* AF8B4 001AF7B4 23104300 */  subu       $2, $2, $3
/* AF8B8 001AF7B8 80100200 */  sll        $2, $2, 2
/* AF8BC 001AF7BC 21104300 */  addu       $2, $2, $3
/* AF8C0 001AF7C0 00110200 */  sll        $2, $2, 4
/* AF8C4 001AF7C4 21108200 */  addu       $2, $4, $2
/* AF8C8 001AF7C8 90044324 */  addiu      $3, $2, 0x490
/* AF8CC 001AF7CC 90017224 */  addiu      $18, $3, 0x190
/* AF8D0 001AF7D0 3806428C */  lw         $2, 0x638($2)
/* AF8D4 001AF7D4 04004014 */  bnez       $2, .L001AF7E8
/* AF8D8 001AF7D8 00000000 */   nop
/* AF8DC 001AF7DC 28160070 */  paddub     $2, $0, $0
/* AF8E0 001AF7E0 5E000010 */  b          .L001AF95C
/* AF8E4 001AF7E4 00000000 */   nop
.L001AF7E8:
/* AF8E8 001AF7E8 6000A427 */  addiu      $4, $sp, 0x60
/* AF8EC 001AF7EC 282E4072 */  paddub     $5, $18, $0
/* AF8F0 001AF7F0 0C86040C */  jal        sceVu0CopyVector
/* AF8F4 001AF7F4 00000000 */   nop
/* AF8F8 001AF7F8 6000A1C7 */  lwc1       $f1, 0x60($sp)
/* AF8FC 001AF7FC 2043023C */  lui        $2, (0x43200000 >> 16)
/* AF900 001AF800 00108244 */  mtc1       $2, $f2
/* AF904 001AF804 00009044 */  mtc1       $16, $f0
/* AF908 001AF808 00000000 */  nop
/* AF90C 001AF80C 20008046 */  cvt.s.w    $f0, $f0
/* AF910 001AF810 02100046 */  mul.s      $f0, $f2, $f0
/* AF914 001AF814 00080046 */  add.s      $f0, $f1, $f0
/* AF918 001AF818 6000A0E7 */  swc1       $f0, 0x60($sp)
/* AF91C 001AF81C 6800A1C7 */  lwc1       $f1, 0x68($sp)
/* AF920 001AF820 00009144 */  mtc1       $17, $f0
/* AF924 001AF824 00000000 */  nop
/* AF928 001AF828 20008046 */  cvt.s.w    $f0, $f0
/* AF92C 001AF82C 02100046 */  mul.s      $f0, $f2, $f0
/* AF930 001AF830 00080046 */  add.s      $f0, $f1, $f0
/* AF934 001AF834 6800A0E7 */  swc1       $f0, 0x68($sp)
/* AF938 001AF838 7000A427 */  addiu      $4, $sp, 0x70
/* AF93C 001AF83C 6000A527 */  addiu      $5, $sp, 0x60
/* AF940 001AF840 0C86040C */  jal        sceVu0CopyVector
/* AF944 001AF844 00000000 */   nop
/* AF948 001AF848 8000A427 */  addiu      $4, $sp, 0x80
/* AF94C 001AF84C 6000A527 */  addiu      $5, $sp, 0x60
/* AF950 001AF850 0C86040C */  jal        sceVu0CopyVector
/* AF954 001AF854 00000000 */   nop
/* AF958 001AF858 0040023C */  lui        $2, (0x40000000 >> 16)
/* AF95C 001AF85C 00108244 */  mtc1       $2, $f2
/* AF960 001AF860 100040C6 */  lwc1       $f0, 0x10($18)
/* AF964 001AF864 43000246 */  div.s      $f1, $f0, $f2
/* AF968 001AF868 7000A0C7 */  lwc1       $f0, 0x70($sp)
/* AF96C 001AF86C 01000146 */  sub.s      $f0, $f0, $f1
/* AF970 001AF870 7000A0E7 */  swc1       $f0, 0x70($sp)
/* AF974 001AF874 140040C6 */  lwc1       $f0, 0x14($18)
/* AF978 001AF878 43000246 */  div.s      $f1, $f0, $f2
/* AF97C 001AF87C 7800A227 */  addiu      $2, $sp, 0x78
/* AF980 001AF880 000040C4 */  lwc1       $f0, 0x0($2)
/* AF984 001AF884 01000146 */  sub.s      $f0, $f0, $f1
/* AF988 001AF888 000040E4 */  swc1       $f0, 0x0($2)
/* AF98C 001AF88C 100040C6 */  lwc1       $f0, 0x10($18)
/* AF990 001AF890 43000246 */  div.s      $f1, $f0, $f2
/* AF994 001AF894 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* AF998 001AF898 00000146 */  add.s      $f0, $f0, $f1
/* AF99C 001AF89C 8000A0E7 */  swc1       $f0, 0x80($sp)
/* AF9A0 001AF8A0 140040C6 */  lwc1       $f0, 0x14($18)
/* AF9A4 001AF8A4 43000246 */  div.s      $f1, $f0, $f2
/* AF9A8 001AF8A8 8800A327 */  addiu      $3, $sp, 0x88
/* AF9AC 001AF8AC 000060C4 */  lwc1       $f0, 0x0($3)
/* AF9B0 001AF8B0 00000146 */  add.s      $f0, $f0, $f1
/* AF9B4 001AF8B4 000060E4 */  swc1       $f0, 0x0($3)
/* AF9B8 001AF8B8 5000A1C7 */  lwc1       $f1, 0x50($sp)
/* AF9BC 001AF8BC 7000A0C7 */  lwc1       $f0, 0x70($sp)
/* AF9C0 001AF8C0 34080046 */  c.lt.s     $f1, $f0
/* AF9C4 001AF8C4 00000000 */  nop
/* AF9C8 001AF8C8 1C000145 */  bc1t       .L001AF93C
/* AF9CC 001AF8CC 00000000 */   nop
/* AF9D0 001AF8D0 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* AF9D4 001AF8D4 36080046 */  c.le.s     $f1, $f0
/* AF9D8 001AF8D8 00000000 */  nop
/* AF9DC 001AF8DC 17000045 */  bc1f       .L001AF93C
/* AF9E0 001AF8E0 00000000 */   nop
/* AF9E4 001AF8E4 000061C6 */  lwc1       $f1, 0x0($19)
/* AF9E8 001AF8E8 000040C4 */  lwc1       $f0, 0x0($2)
/* AF9EC 001AF8EC 34080046 */  c.lt.s     $f1, $f0
/* AF9F0 001AF8F0 00000000 */  nop
/* AF9F4 001AF8F4 11000145 */  bc1t       .L001AF93C
/* AF9F8 001AF8F8 00000000 */   nop
/* AF9FC 001AF8FC 000060C4 */  lwc1       $f0, 0x0($3)
/* AFA00 001AF900 34080046 */  c.lt.s     $f1, $f0
/* AFA04 001AF904 00000000 */  nop
/* AFA08 001AF908 0C000045 */  bc1f       .L001AF93C
/* AFA0C 001AF90C 00000000 */   nop
/* AFA10 001AF910 5400A1C7 */  lwc1       $f1, 0x54($sp)
/* AFA14 001AF914 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* AFA18 001AF918 34080046 */  c.lt.s     $f1, $f0
/* AFA1C 001AF91C 00000000 */  nop
/* AFA20 001AF920 06000045 */  bc1f       .L001AF93C
/* AFA24 001AF924 00000000 */   nop
/* AFA28 001AF928 01000224 */  addiu      $2, $0, 0x1
/* AFA2C 001AF92C DC01013C */  lui        $at, (0x1DC4514 >> 16)
/* AFA30 001AF930 144522A4 */  sh         $2, (0x1DC4514 & 0xFFFF)($at)
/* AFA34 001AF934 09000010 */  b          .L001AF95C
/* AFA38 001AF938 00000000 */   nop
.L001AF93C:
/* AFA3C 001AF93C 04004016 */  bnez       $18, .L001AF950
/* AFA40 001AF940 00000000 */   nop
/* AFA44 001AF944 28160070 */  paddub     $2, $0, $0
/* AFA48 001AF948 04000010 */  b          .L001AF95C
/* AFA4C 001AF94C 00000000 */   nop
.L001AF950:
/* AFA50 001AF950 1800438E */  lw         $3, 0x18($18)
/* AFA54 001AF954 28160070 */  paddub     $2, $0, $0
/* AFA58 001AF958 0A100300 */  movz       $2, $0, $3
.L001AF95C:
/* AFA5C 001AF95C 4000BF7B */  lq         $31, 0x40($sp)
/* AFA60 001AF960 3000B37B */  lq         $19, 0x30($sp)
/* AFA64 001AF964 2000B27B */  lq         $18, 0x20($sp)
/* AFA68 001AF968 1000B17B */  lq         $17, 0x10($sp)
/* AFA6C 001AF96C 0000B07B */  lq         $16, 0x0($sp)
/* AFA70 001AF970 9000BD27 */  addiu      $sp, $sp, 0x90
/* AFA74 001AF974 0800E003 */  jr         $31
/* AFA78 001AF978 00000000 */   nop
/* AFA7C 001AF97C 00000000 */  nop
