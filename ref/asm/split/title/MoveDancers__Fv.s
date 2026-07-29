.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MoveDancers__Fv
/* 00B8D0 01DB75D0 00FFBD27 */  addiu       $29, $29, -0x100
/* 00B8D4 01DB75D4 2000BF7F */  sq          $31, 0x20($29)
/* 00B8D8 01DB75D8 1000B17F */  sq          $17, 0x10($29)
/* 00B8DC 01DB75DC 0000B07F */  sq          $16, 0x0($29)
/* 00B8E0 01DB75E0 DD01033C */  lui         $3, %hi(LIT_868__3)
/* 00B8E4 01DB75E4 00676724 */  addiu       $7, $3, %lo(LIT_868__3)
/* 00B8E8 01DB75E8 3000A627 */  addiu       $6, $29, 0x30
/* 00B8EC 01DB75EC 04000524 */  addiu       $5, $0, 0x4
.L01DB75F0_2BCDF0:
/* 00B8F0 01DB75F0 0000E478 */  lq          $4, 0x0($7)
/* 00B8F4 01DB75F4 1000E378 */  lq          $3, 0x10($7)
/* 00B8F8 01DB75F8 2000E724 */  addiu       $7, $7, 0x20
/* 00B8FC 01DB75FC FFFFA524 */  addiu       $5, $5, -0x1
/* 00B900 01DB7600 0000C47C */  sq          $4, 0x0($6)
/* 00B904 01DB7604 1000C37C */  sq          $3, 0x10($6)
/* 00B908 01DB7608 2000C624 */  addiu       $6, $6, 0x20
/* 00B90C 01DB760C F8FFA01C */  bgtz        $5, .L01DB75F0_2BCDF0
/* 00B910 01DB7610 00000000 */   nop
/* 00B914 01DB7614 0000E4DC */  ld          $4, 0x0($7)
/* 00B918 01DB7618 0800E3C4 */  lwc1        $f3, 0x8($7)
/* 00B91C 01DB761C 0000C4FC */  sd          $4, 0x0($6)
/* 00B920 01DB7620 0800C3E4 */  swc1        $f3, 0x8($6)
/* 00B924 01DB7624 DE01013C */  lui         $1, %hi(CScript__2 + 0x1AC)
/* 00B928 01DB7628 AC1C2390 */  lbu         $3, %lo(CScript__2 + 0x1AC)($1)
/* 00B92C 01DB762C 44006010 */  beqz        $3, .L01DB7740_2BCF40
/* 00B930 01DB7630 00000000 */   nop
/* 00B934 01DB7634 28860070 */  paddub      $16, $0, $0
/* 00B938 01DB7638 3E000010 */  b           .L01DB7734_2BCF34
/* 00B93C 01DB763C 00000000 */   nop
.L01DB7640_2BCE40:
/* 00B940 01DB7640 0498838F */  lw          $3, -0x67FC($28)
/* 00B944 01DB7644 B0110224 */  addiu       $2, $0, 0x11B0
/* 00B948 01DB7648 18186200 */  mult        $3, $3, $2
/* 00B94C 01DB764C E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 00B950 01DB7650 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 00B954 01DB7654 21184300 */  addu        $3, $2, $3
/* 00B958 01DB7658 80101000 */  sll         $2, $16, 2
/* 00B95C 01DB765C 21105D00 */  addu        $2, $2, $29
/* 00B960 01DB7660 0000648C */  lw          $4, 0x0($3)
/* 00B964 01DB7664 3000458C */  lw          $5, 0x30($2)
/* 00B968 01DB7668 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00B96C 01DB766C 00000000 */   nop
/* 00B970 01DB7670 28264070 */  paddub      $4, $2, $0
/* 00B974 01DB7674 2E008010 */  beqz        $4, .L01DB7730_2BCF30
/* 00B978 01DB7678 00000000 */   nop
/* 00B97C 01DB767C C000A527 */  addiu       $5, $29, 0xC0
/* 00B980 01DB7680 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 00B984 01DB7684 00000000 */   nop
/* 00B988 01DB7688 F000A0C7 */  lwc1        $f0, 0xF0($29)
/* 00B98C 01DB768C 00891000 */  sll         $17, $16, 4
/* 00B990 01DB7690 E201023C */  lui         $2, %hi(DancerPos)
/* 00B994 01DB7694 60E04224 */  addiu       $2, $2, %lo(DancerPos)
/* 00B998 01DB7698 21105100 */  addu        $2, $2, $17
/* 00B99C 01DB769C 000040E4 */  swc1        $f0, 0x0($2)
/* 00B9A0 01DB76A0 F400A0C7 */  lwc1        $f0, 0xF4($29)
/* 00B9A4 01DB76A4 E201023C */  lui         $2, %hi(DancerPos + 0x4)
/* 00B9A8 01DB76A8 64E04224 */  addiu       $2, $2, %lo(DancerPos + 0x4)
/* 00B9AC 01DB76AC 21105100 */  addu        $2, $2, $17
/* 00B9B0 01DB76B0 000040E4 */  swc1        $f0, 0x0($2)
/* 00B9B4 01DB76B4 F800A0C7 */  lwc1        $f0, 0xF8($29)
/* 00B9B8 01DB76B8 E201023C */  lui         $2, %hi(DancerPos + 0x8)
/* 00B9BC 01DB76BC 68E04224 */  addiu       $2, $2, %lo(DancerPos + 0x8)
/* 00B9C0 01DB76C0 21105100 */  addu        $2, $2, $17
/* 00B9C4 01DB76C4 000040E4 */  swc1        $f0, 0x0($2)
/* 00B9C8 01DB76C8 E201023C */  lui         $2, %hi(DancerRot)
/* 00B9CC 01DB76CC 90E24224 */  addiu       $2, $2, %lo(DancerRot)
/* 00B9D0 01DB76D0 21105100 */  addu        $2, $2, $17
/* 00B9D4 01DB76D4 000040AC */  sw          $0, 0x0($2)
/* 00B9D8 01DB76D8 E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 00B9DC 01DB76DC E800ADC7 */  lwc1        $f13, 0xE8($29)
/* 00B9E0 01DB76E0 5077040C */  jal         atan2f
/* 00B9E4 01DB76E4 00000000 */   nop
/* 00B9E8 01DB76E8 06030046 */  mov.s       $f12, $f0
/* 00B9EC 01DB76EC 9044040C */  jal         fptodp
/* 00B9F0 01DB76F0 00000000 */   nop
/* 00B9F4 01DB76F4 188084DF */  ld          $4, -0x7FE8($28)
/* 00B9F8 01DB76F8 282E4070 */  paddub      $5, $2, $0
/* 00B9FC 01DB76FC 6E3F040C */  jal         dpadd
/* 00BA00 01DB7700 00000000 */   nop
/* 00BA04 01DB7704 28264070 */  paddub      $4, $2, $0
/* 00BA08 01DB7708 9241040C */  jal         dptofp
/* 00BA0C 01DB770C 00000000 */   nop
/* 00BA10 01DB7710 E201033C */  lui         $3, %hi(DancerRot + 0x4)
/* 00BA14 01DB7714 94E26324 */  addiu       $3, $3, %lo(DancerRot + 0x4)
/* 00BA18 01DB7718 21187100 */  addu        $3, $3, $17
/* 00BA1C 01DB771C 000060E4 */  swc1        $f0, 0x0($3)
/* 00BA20 01DB7720 E201033C */  lui         $3, %hi(DancerRot + 0x8)
/* 00BA24 01DB7724 98E26324 */  addiu       $3, $3, %lo(DancerRot + 0x8)
/* 00BA28 01DB7728 21187100 */  addu        $3, $3, $17
/* 00BA2C 01DB772C 000060AC */  sw          $0, 0x0($3)
.L01DB7730_2BCF30:
/* 00BA30 01DB7730 01001026 */  addiu       $16, $16, 0x1
.L01DB7734_2BCF34:
/* 00BA34 01DB7734 2300032A */  slti        $3, $16, 0x23
/* 00BA38 01DB7738 C1FF6014 */  bnez        $3, .L01DB7640_2BCE40
/* 00BA3C 01DB773C 00000000 */   nop
.L01DB7740_2BCF40:
/* 00BA40 01DB7740 2000BF7B */  lq          $31, 0x20($29)
/* 00BA44 01DB7744 1000B17B */  lq          $17, 0x10($29)
/* 00BA48 01DB7748 0000B07B */  lq          $16, 0x0($29)
/* 00BA4C 01DB774C 0001BD27 */  addiu       $29, $29, 0x100
/* 00BA50 01DB7750 0800E003 */  jr          $31
/* 00BA54 01DB7754 00000000 */   nop
/* 00BA58 01DB7758 00000000 */  nop
/* 00BA5C 01DB775C 00000000 */  nop
