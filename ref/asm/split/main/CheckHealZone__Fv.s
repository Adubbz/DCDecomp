.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckHealZone__Fv
/* 0AF7E0 001AF6E0 70FFBD27 */  addiu       $29, $29, -0x90
/* 0AF7E4 001AF6E4 4000BF7F */  sq          $31, 0x40($29)
/* 0AF7E8 001AF6E8 3000B37F */  sq          $19, 0x30($29)
/* 0AF7EC 001AF6EC 2000B27F */  sq          $18, 0x20($29)
/* 0AF7F0 001AF6F0 1000B17F */  sq          $17, 0x10($29)
/* 0AF7F4 001AF6F4 0000B07F */  sq          $16, 0x0($29)
/* 0AF7F8 001AF6F8 5000A427 */  addiu       $4, $29, 0x50
/* 0AF7FC 001AF6FC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0AF800 001AF700 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0AF804 001AF704 0C86040C */  jal         sceVu0CopyVector
/* 0AF808 001AF708 00000000 */   nop
/* 0AF80C 001AF70C DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 0AF810 001AF710 144520A4 */  sh          $0, %lo(BtActStatus + 0x94)($1)
/* 0AF814 001AF714 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 0AF818 001AF718 00088244 */  mtc1        $2, $f1
/* 0AF81C 001AF71C 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 0AF820 001AF720 40080046 */  add.s       $f1, $f1, $f0
/* 0AF824 001AF724 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0AF828 001AF728 00008244 */  mtc1        $2, $f0
/* 0AF82C 001AF72C 00000000 */  nop
/* 0AF830 001AF730 030B0046 */  div.s       $f12, $f1, $f0
/* 0AF834 001AF734 2C44040C */  jal         fptosi
/* 0AF838 001AF738 00000000 */   nop
/* 0AF83C 001AF73C 28864070 */  paddub      $16, $2, $0
/* 0AF840 001AF740 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 0AF844 001AF744 00088244 */  mtc1        $2, $f1
/* 0AF848 001AF748 5800B327 */  addiu       $19, $29, 0x58
/* 0AF84C 001AF74C 000060C6 */  lwc1        $f0, 0x0($19)
/* 0AF850 001AF750 40080046 */  add.s       $f1, $f1, $f0
/* 0AF854 001AF754 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0AF858 001AF758 00008244 */  mtc1        $2, $f0
/* 0AF85C 001AF75C 00000000 */  nop
/* 0AF860 001AF760 030B0046 */  div.s       $f12, $f1, $f0
/* 0AF864 001AF764 2C44040C */  jal         fptosi
/* 0AF868 001AF768 00000000 */   nop
/* 0AF86C 001AF76C 288E4070 */  paddub      $17, $2, $0
/* 0AF870 001AF770 80180200 */  sll         $3, $2, 2
/* 0AF874 001AF774 21106200 */  addu        $2, $3, $2
/* 0AF878 001AF778 80100200 */  sll         $2, $2, 2
/* 0AF87C 001AF77C 21100202 */  addu        $2, $16, $2
/* 0AF880 001AF780 00110200 */  sll         $2, $2, 4
/* 0AF884 001AF784 C89C848F */  lw          $4, -0x6338($28)
/* 0AF888 001AF788 21104400 */  addu        $2, $2, $4
/* 0AF88C 001AF78C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AF890 001AF790 21084100 */  addu        $1, $2, $1
/* 0AF894 001AF794 509C238C */  lw          $3, -0x63B0($1)
/* 0AF898 001AF798 FFFF0224 */  addiu       $2, $0, -0x1
/* 0AF89C 001AF79C 04006214 */  bne         $3, $2, .L001AF7B0
/* 0AF8A0 001AF7A0 00000000 */   nop
/* 0AF8A4 001AF7A4 28160070 */  paddub      $2, $0, $0
/* 0AF8A8 001AF7A8 6C000010 */  b           .L001AF95C
/* 0AF8AC 001AF7AC 00000000 */   nop
.L001AF7B0:
/* 0AF8B0 001AF7B0 C0100300 */  sll         $2, $3, 3
/* 0AF8B4 001AF7B4 23104300 */  subu        $2, $2, $3
/* 0AF8B8 001AF7B8 80100200 */  sll         $2, $2, 2
/* 0AF8BC 001AF7BC 21104300 */  addu        $2, $2, $3
/* 0AF8C0 001AF7C0 00110200 */  sll         $2, $2, 4
/* 0AF8C4 001AF7C4 21108200 */  addu        $2, $4, $2
/* 0AF8C8 001AF7C8 90044324 */  addiu       $3, $2, 0x490
/* 0AF8CC 001AF7CC 90017224 */  addiu       $18, $3, 0x190
/* 0AF8D0 001AF7D0 3806428C */  lw          $2, 0x638($2)
/* 0AF8D4 001AF7D4 04004014 */  bnez        $2, .L001AF7E8
/* 0AF8D8 001AF7D8 00000000 */   nop
/* 0AF8DC 001AF7DC 28160070 */  paddub      $2, $0, $0
/* 0AF8E0 001AF7E0 5E000010 */  b           .L001AF95C
/* 0AF8E4 001AF7E4 00000000 */   nop
.L001AF7E8:
/* 0AF8E8 001AF7E8 6000A427 */  addiu       $4, $29, 0x60
/* 0AF8EC 001AF7EC 282E4072 */  paddub      $5, $18, $0
/* 0AF8F0 001AF7F0 0C86040C */  jal         sceVu0CopyVector
/* 0AF8F4 001AF7F4 00000000 */   nop
/* 0AF8F8 001AF7F8 6000A1C7 */  lwc1        $f1, 0x60($29)
/* 0AF8FC 001AF7FC 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0AF900 001AF800 00108244 */  mtc1        $2, $f2
/* 0AF904 001AF804 00009044 */  mtc1        $16, $f0
/* 0AF908 001AF808 00000000 */  nop
/* 0AF90C 001AF80C 20008046 */  cvt.s.w     $f0, $f0
/* 0AF910 001AF810 02100046 */  mul.s       $f0, $f2, $f0
/* 0AF914 001AF814 00080046 */  add.s       $f0, $f1, $f0
/* 0AF918 001AF818 6000A0E7 */  swc1        $f0, 0x60($29)
/* 0AF91C 001AF81C 6800A1C7 */  lwc1        $f1, 0x68($29)
/* 0AF920 001AF820 00009144 */  mtc1        $17, $f0
/* 0AF924 001AF824 00000000 */  nop
/* 0AF928 001AF828 20008046 */  cvt.s.w     $f0, $f0
/* 0AF92C 001AF82C 02100046 */  mul.s       $f0, $f2, $f0
/* 0AF930 001AF830 00080046 */  add.s       $f0, $f1, $f0
/* 0AF934 001AF834 6800A0E7 */  swc1        $f0, 0x68($29)
/* 0AF938 001AF838 7000A427 */  addiu       $4, $29, 0x70
/* 0AF93C 001AF83C 6000A527 */  addiu       $5, $29, 0x60
/* 0AF940 001AF840 0C86040C */  jal         sceVu0CopyVector
/* 0AF944 001AF844 00000000 */   nop
/* 0AF948 001AF848 8000A427 */  addiu       $4, $29, 0x80
/* 0AF94C 001AF84C 6000A527 */  addiu       $5, $29, 0x60
/* 0AF950 001AF850 0C86040C */  jal         sceVu0CopyVector
/* 0AF954 001AF854 00000000 */   nop
/* 0AF958 001AF858 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0AF95C 001AF85C 00108244 */  mtc1        $2, $f2
/* 0AF960 001AF860 100040C6 */  lwc1        $f0, 0x10($18)
/* 0AF964 001AF864 43000246 */  div.s       $f1, $f0, $f2
/* 0AF968 001AF868 7000A0C7 */  lwc1        $f0, 0x70($29)
/* 0AF96C 001AF86C 01000146 */  sub.s       $f0, $f0, $f1
/* 0AF970 001AF870 7000A0E7 */  swc1        $f0, 0x70($29)
/* 0AF974 001AF874 140040C6 */  lwc1        $f0, 0x14($18)
/* 0AF978 001AF878 43000246 */  div.s       $f1, $f0, $f2
/* 0AF97C 001AF87C 7800A227 */  addiu       $2, $29, 0x78
/* 0AF980 001AF880 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AF984 001AF884 01000146 */  sub.s       $f0, $f0, $f1
/* 0AF988 001AF888 000040E4 */  swc1        $f0, 0x0($2)
/* 0AF98C 001AF88C 100040C6 */  lwc1        $f0, 0x10($18)
/* 0AF990 001AF890 43000246 */  div.s       $f1, $f0, $f2
/* 0AF994 001AF894 8000A0C7 */  lwc1        $f0, 0x80($29)
/* 0AF998 001AF898 00000146 */  add.s       $f0, $f0, $f1
/* 0AF99C 001AF89C 8000A0E7 */  swc1        $f0, 0x80($29)
/* 0AF9A0 001AF8A0 140040C6 */  lwc1        $f0, 0x14($18)
/* 0AF9A4 001AF8A4 43000246 */  div.s       $f1, $f0, $f2
/* 0AF9A8 001AF8A8 8800A327 */  addiu       $3, $29, 0x88
/* 0AF9AC 001AF8AC 000060C4 */  lwc1        $f0, 0x0($3)
/* 0AF9B0 001AF8B0 00000146 */  add.s       $f0, $f0, $f1
/* 0AF9B4 001AF8B4 000060E4 */  swc1        $f0, 0x0($3)
/* 0AF9B8 001AF8B8 5000A1C7 */  lwc1        $f1, 0x50($29)
/* 0AF9BC 001AF8BC 7000A0C7 */  lwc1        $f0, 0x70($29)
/* 0AF9C0 001AF8C0 34080046 */  c.lt.s      $f1, $f0
/* 0AF9C4 001AF8C4 00000000 */  nop
/* 0AF9C8 001AF8C8 1C000145 */  bc1t        .L001AF93C
/* 0AF9CC 001AF8CC 00000000 */   nop
/* 0AF9D0 001AF8D0 8000A0C7 */  lwc1        $f0, 0x80($29)
/* 0AF9D4 001AF8D4 36080046 */  c.le.s      $f1, $f0
/* 0AF9D8 001AF8D8 00000000 */  nop
/* 0AF9DC 001AF8DC 17000045 */  bc1f        .L001AF93C
/* 0AF9E0 001AF8E0 00000000 */   nop
/* 0AF9E4 001AF8E4 000061C6 */  lwc1        $f1, 0x0($19)
/* 0AF9E8 001AF8E8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AF9EC 001AF8EC 34080046 */  c.lt.s      $f1, $f0
/* 0AF9F0 001AF8F0 00000000 */  nop
/* 0AF9F4 001AF8F4 11000145 */  bc1t        .L001AF93C
/* 0AF9F8 001AF8F8 00000000 */   nop
/* 0AF9FC 001AF8FC 000060C4 */  lwc1        $f0, 0x0($3)
/* 0AFA00 001AF900 34080046 */  c.lt.s      $f1, $f0
/* 0AFA04 001AF904 00000000 */  nop
/* 0AFA08 001AF908 0C000045 */  bc1f        .L001AF93C
/* 0AFA0C 001AF90C 00000000 */   nop
/* 0AFA10 001AF910 5400A1C7 */  lwc1        $f1, 0x54($29)
/* 0AFA14 001AF914 6400A0C7 */  lwc1        $f0, 0x64($29)
/* 0AFA18 001AF918 34080046 */  c.lt.s      $f1, $f0
/* 0AFA1C 001AF91C 00000000 */  nop
/* 0AFA20 001AF920 06000045 */  bc1f        .L001AF93C
/* 0AFA24 001AF924 00000000 */   nop
/* 0AFA28 001AF928 01000224 */  addiu       $2, $0, 0x1
/* 0AFA2C 001AF92C DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 0AFA30 001AF930 144522A4 */  sh          $2, %lo(BtActStatus + 0x94)($1)
/* 0AFA34 001AF934 09000010 */  b           .L001AF95C
/* 0AFA38 001AF938 00000000 */   nop
.L001AF93C:
/* 0AFA3C 001AF93C 04004016 */  bnez        $18, .L001AF950
/* 0AFA40 001AF940 00000000 */   nop
/* 0AFA44 001AF944 28160070 */  paddub      $2, $0, $0
/* 0AFA48 001AF948 04000010 */  b           .L001AF95C
/* 0AFA4C 001AF94C 00000000 */   nop
.L001AF950:
/* 0AFA50 001AF950 1800438E */  lw          $3, 0x18($18)
/* 0AFA54 001AF954 28160070 */  paddub      $2, $0, $0
/* 0AFA58 001AF958 0A100300 */  movz        $2, $0, $3
.L001AF95C:
/* 0AFA5C 001AF95C 4000BF7B */  lq          $31, 0x40($29)
/* 0AFA60 001AF960 3000B37B */  lq          $19, 0x30($29)
/* 0AFA64 001AF964 2000B27B */  lq          $18, 0x20($29)
/* 0AFA68 001AF968 1000B17B */  lq          $17, 0x10($29)
/* 0AFA6C 001AF96C 0000B07B */  lq          $16, 0x0($29)
/* 0AFA70 001AF970 9000BD27 */  addiu       $29, $29, 0x90
/* 0AFA74 001AF974 0800E003 */  jr          $31
/* 0AFA78 001AF978 00000000 */   nop
/* 0AFA7C 001AF97C 00000000 */  nop
