.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__13CSHOT_FIREBARFPfPfii
/* 0AEE40 001AED40 90FFBD27 */  addiu       $29, $29, -0x70
/* 0AEE44 001AED44 5000BF7F */  sq          $31, 0x50($29)
/* 0AEE48 001AED48 4000B47F */  sq          $20, 0x40($29)
/* 0AEE4C 001AED4C 3000B37F */  sq          $19, 0x30($29)
/* 0AEE50 001AED50 2000B27F */  sq          $18, 0x20($29)
/* 0AEE54 001AED54 1000B17F */  sq          $17, 0x10($29)
/* 0AEE58 001AED58 0000B07F */  sq          $16, 0x0($29)
/* 0AEE5C 001AED5C 28A68070 */  paddub      $20, $4, $0
/* 0AEE60 001AED60 289EA070 */  paddub      $19, $5, $0
/* 0AEE64 001AED64 2886C070 */  paddub      $16, $6, $0
/* 0AEE68 001AED68 2896E070 */  paddub      $18, $7, $0
/* 0AEE6C 001AED6C 288E0071 */  paddub      $17, $8, $0
/* 0AEE70 001AED70 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AEE74 001AED74 0C00C2AC */  sw          $2, 0xC($6)
/* 0AEE78 001AED78 28260072 */  paddub      $4, $16, $0
/* 0AEE7C 001AED7C 282E0072 */  paddub      $5, $16, $0
/* 0AEE80 001AED80 9285040C */  jal         sceVu0Normalize
/* 0AEE84 001AED84 00000000 */   nop
/* 0AEE88 001AED88 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0AEE8C 001AED8C 00608244 */  mtc1        $2, $f12
/* 0AEE90 001AED90 6000A427 */  addiu       $4, $29, 0x60
/* 0AEE94 001AED94 282E0072 */  paddub      $5, $16, $0
/* 0AEE98 001AED98 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 0AEE9C 001AED9C 00000000 */   nop
/* 0AEEA0 001AEDA0 28860070 */  paddub      $16, $0, $0
/* 0AEEA4 001AEDA4 60000010 */  b           .L001AEF28
/* 0AEEA8 001AEDA8 00000000 */   nop
.L001AEDAC:
/* 0AEEAC 001AEDAC 000D828E */  lw          $2, 0xD00($20)
/* 0AEEB0 001AEDB0 21100202 */  addu        $2, $16, $2
/* 0AEEB4 001AEDB4 00110200 */  sll         $2, $2, 4
/* 0AEEB8 001AEDB8 000061C6 */  lwc1        $f1, 0x0($19)
/* 0AEEBC 001AEDBC 00009044 */  mtc1        $16, $f0
/* 0AEEC0 001AEDC0 00000000 */  nop
/* 0AEEC4 001AEDC4 E0008046 */  cvt.s.w     $f3, $f0
/* 0AEEC8 001AEDC8 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 0AEECC 001AEDCC 02000346 */  mul.s       $f0, $f0, $f3
/* 0AEED0 001AEDD0 40080046 */  add.s       $f1, $f1, $f0
/* 0AEED4 001AEDD4 21188202 */  addu        $3, $20, $2
/* 0AEED8 001AEDD8 000060C4 */  lwc1        $f0, 0x0($3)
/* 0AEEDC 001AEDDC 81080046 */  sub.s       $f2, $f1, $f0
/* 0AEEE0 001AEDE0 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0AEEE4 001AEDE4 00008244 */  mtc1        $2, $f0
/* 0AEEE8 001AEDE8 00000000 */  nop
/* 0AEEEC 001AEDEC 42000346 */  mul.s       $f1, $f0, $f3
/* 0AEEF0 001AEDF0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AEEF4 001AEDF4 00008244 */  mtc1        $2, $f0
/* 0AEEF8 001AEDF8 00000000 */  nop
/* 0AEEFC 001AEDFC 00010146 */  add.s       $f4, $f0, $f1
/* 0AEF00 001AEE00 03100446 */  div.s       $f0, $f2, $f4
/* 0AEF04 001AEE04 000460E4 */  swc1        $f0, 0x400($3)
/* 0AEF08 001AEE08 000D828E */  lw          $2, 0xD00($20)
/* 0AEF0C 001AEE0C 21100202 */  addu        $2, $16, $2
/* 0AEF10 001AEE10 00110200 */  sll         $2, $2, 4
/* 0AEF14 001AEE14 040061C6 */  lwc1        $f1, 0x4($19)
/* 0AEF18 001AEE18 6400A0C7 */  lwc1        $f0, 0x64($29)
/* 0AEF1C 001AEE1C 02000346 */  mul.s       $f0, $f0, $f3
/* 0AEF20 001AEE20 40080046 */  add.s       $f1, $f1, $f0
/* 0AEF24 001AEE24 21105400 */  addu        $2, $2, $20
/* 0AEF28 001AEE28 040040C4 */  lwc1        $f0, 0x4($2)
/* 0AEF2C 001AEE2C 01080046 */  sub.s       $f0, $f1, $f0
/* 0AEF30 001AEE30 03000446 */  div.s       $f0, $f0, $f4
/* 0AEF34 001AEE34 040440E4 */  swc1        $f0, 0x404($2)
/* 0AEF38 001AEE38 000D828E */  lw          $2, 0xD00($20)
/* 0AEF3C 001AEE3C 21100202 */  addu        $2, $16, $2
/* 0AEF40 001AEE40 00110200 */  sll         $2, $2, 4
/* 0AEF44 001AEE44 080061C6 */  lwc1        $f1, 0x8($19)
/* 0AEF48 001AEE48 6800A0C7 */  lwc1        $f0, 0x68($29)
/* 0AEF4C 001AEE4C 02000346 */  mul.s       $f0, $f0, $f3
/* 0AEF50 001AEE50 40080046 */  add.s       $f1, $f1, $f0
/* 0AEF54 001AEE54 21105400 */  addu        $2, $2, $20
/* 0AEF58 001AEE58 080040C4 */  lwc1        $f0, 0x8($2)
/* 0AEF5C 001AEE5C 01080046 */  sub.s       $f0, $f1, $f0
/* 0AEF60 001AEE60 03000446 */  div.s       $f0, $f0, $f4
/* 0AEF64 001AEE64 080440E4 */  swc1        $f0, 0x408($2)
/* 0AEF68 001AEE68 000D828E */  lw          $2, 0xD00($20)
/* 0AEF6C 001AEE6C 21100202 */  addu        $2, $16, $2
/* 0AEF70 001AEE70 80100200 */  sll         $2, $2, 2
/* 0AEF74 001AEE74 21105400 */  addu        $2, $2, $20
/* 0AEF78 001AEE78 000C40AC */  sw          $0, 0xC00($2)
/* 0AEF7C 001AEE7C BE11040C */  jal         rand
/* 0AEF80 001AEE80 00000000 */   nop
/* 0AEF84 001AEE84 00008244 */  mtc1        $2, $f0
/* 0AEF88 001AEE88 00000000 */  nop
/* 0AEF8C 001AEE8C 20008046 */  cvt.s.w     $f0, $f0
/* 0AEF90 001AEE90 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0AEF94 001AEE94 00188244 */  mtc1        $2, $f3
/* 0AEF98 001AEE98 00000000 */  nop
/* 0AEF9C 001AEE9C 42180046 */  mul.s       $f1, $f3, $f0
/* 0AEFA0 001AEEA0 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0AEFA4 001AEEA4 00008244 */  mtc1        $2, $f0
/* 0AEFA8 001AEEA8 00000000 */  nop
/* 0AEFAC 001AEEAC 83080046 */  div.s       $f2, $f1, $f0
/* 0AEFB0 001AEEB0 00009044 */  mtc1        $16, $f0
/* 0AEFB4 001AEEB4 00000000 */  nop
/* 0AEFB8 001AEEB8 60008046 */  cvt.s.w     $f1, $f0
/* 0AEFBC 001AEEBC 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0AEFC0 001AEEC0 02000146 */  mul.s       $f0, $f0, $f1
/* 0AEFC4 001AEEC4 00180046 */  add.s       $f0, $f3, $f0
/* 0AEFC8 001AEEC8 00000246 */  add.s       $f0, $f0, $f2
/* 0AEFCC 001AEECC 000D828E */  lw          $2, 0xD00($20)
/* 0AEFD0 001AEED0 21100202 */  addu        $2, $16, $2
/* 0AEFD4 001AEED4 80100200 */  sll         $2, $2, 2
/* 0AEFD8 001AEED8 21105400 */  addu        $2, $2, $20
/* 0AEFDC 001AEEDC 000840E4 */  swc1        $f0, 0x800($2)
/* 0AEFE0 001AEEE0 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0AEFE4 001AEEE4 00008244 */  mtc1        $2, $f0
/* 0AEFE8 001AEEE8 00000000 */  nop
/* 0AEFEC 001AEEEC 42000146 */  mul.s       $f1, $f0, $f1
/* 0AEFF0 001AEEF0 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0AEFF4 001AEEF4 00008244 */  mtc1        $2, $f0
/* 0AEFF8 001AEEF8 00000000 */  nop
/* 0AEFFC 001AEEFC 01000146 */  sub.s       $f0, $f0, $f1
/* 0AF000 001AEF00 000D828E */  lw          $2, 0xD00($20)
/* 0AF004 001AEF04 21100202 */  addu        $2, $16, $2
/* 0AF008 001AEF08 80100200 */  sll         $2, $2, 2
/* 0AF00C 001AEF0C 21105400 */  addu        $2, $2, $20
/* 0AF010 001AEF10 000940E4 */  swc1        $f0, 0x900($2)
/* 0AF014 001AEF14 80101000 */  sll         $2, $16, 2
/* 0AF018 001AEF18 21105400 */  addu        $2, $2, $20
/* 0AF01C 001AEF1C 000A52AC */  sw          $18, 0xA00($2)
/* 0AF020 001AEF20 000B51AC */  sw          $17, 0xB00($2)
/* 0AF024 001AEF24 01001026 */  addiu       $16, $16, 0x1
.L001AEF28:
/* 0AF028 001AEF28 1800022A */  slti        $2, $16, 0x18
/* 0AF02C 001AEF2C 9FFF4014 */  bnez        $2, .L001AEDAC
/* 0AF030 001AEF30 00000000 */   nop
/* 0AF034 001AEF34 FFFF0224 */  addiu       $2, $0, -0x1
/* 0AF038 001AEF38 5000BF7B */  lq          $31, 0x50($29)
/* 0AF03C 001AEF3C 4000B47B */  lq          $20, 0x40($29)
/* 0AF040 001AEF40 3000B37B */  lq          $19, 0x30($29)
/* 0AF044 001AEF44 2000B27B */  lq          $18, 0x20($29)
/* 0AF048 001AEF48 1000B17B */  lq          $17, 0x10($29)
/* 0AF04C 001AEF4C 0000B07B */  lq          $16, 0x0($29)
/* 0AF050 001AEF50 7000BD27 */  addiu       $29, $29, 0x70
/* 0AF054 001AEF54 0800E003 */  jr          $31
/* 0AF058 001AEF58 00000000 */   nop
/* 0AF05C 001AEF5C 00000000 */  nop
