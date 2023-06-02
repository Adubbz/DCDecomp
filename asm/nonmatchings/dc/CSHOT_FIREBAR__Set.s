.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Set__13CSHOT_FIREBARFPfPfii
/* AEE40 001AED40 90FFBD27 */  addiu      $sp, $sp, -0x70
/* AEE44 001AED44 5000BF7F */  sq         $31, 0x50($sp)
/* AEE48 001AED48 4000B47F */  sq         $20, 0x40($sp)
/* AEE4C 001AED4C 3000B37F */  sq         $19, 0x30($sp)
/* AEE50 001AED50 2000B27F */  sq         $18, 0x20($sp)
/* AEE54 001AED54 1000B17F */  sq         $17, 0x10($sp)
/* AEE58 001AED58 0000B07F */  sq         $16, 0x0($sp)
/* AEE5C 001AED5C 28A68070 */  paddub     $20, $4, $0
/* AEE60 001AED60 289EA070 */  paddub     $19, $5, $0
/* AEE64 001AED64 2886C070 */  paddub     $16, $6, $0
/* AEE68 001AED68 2896E070 */  paddub     $18, $7, $0
/* AEE6C 001AED6C 288E0071 */  paddub     $17, $8, $0
/* AEE70 001AED70 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AEE74 001AED74 0C00C2AC */  sw         $2, 0xC($6)
/* AEE78 001AED78 28260072 */  paddub     $4, $16, $0
/* AEE7C 001AED7C 282E0072 */  paddub     $5, $16, $0
/* AEE80 001AED80 9285040C */  jal        sceVu0Normalize
/* AEE84 001AED84 00000000 */   nop
/* AEE88 001AED88 0040023C */  lui        $2, (0x40000000 >> 16)
/* AEE8C 001AED8C 00608244 */  mtc1       $2, $f12
/* AEE90 001AED90 6000A427 */  addiu      $4, $sp, 0x60
/* AEE94 001AED94 282E0072 */  paddub     $5, $16, $0
/* AEE98 001AED98 4688040C */  jal        sceVu0ScaleVectorXYZ
/* AEE9C 001AED9C 00000000 */   nop
/* AEEA0 001AEDA0 28860070 */  paddub     $16, $0, $0
/* AEEA4 001AEDA4 60000010 */  b          .L001AEF28
/* AEEA8 001AEDA8 00000000 */   nop
.L001AEDAC:
/* AEEAC 001AEDAC 000D828E */  lw         $2, 0xD00($20)
/* AEEB0 001AEDB0 21100202 */  addu       $2, $16, $2
/* AEEB4 001AEDB4 00110200 */  sll        $2, $2, 4
/* AEEB8 001AEDB8 000061C6 */  lwc1       $f1, 0x0($19)
/* AEEBC 001AEDBC 00009044 */  mtc1       $16, $f0
/* AEEC0 001AEDC0 00000000 */  nop
/* AEEC4 001AEDC4 E0008046 */  cvt.s.w    $f3, $f0
/* AEEC8 001AEDC8 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* AEECC 001AEDCC 02000346 */  mul.s      $f0, $f0, $f3
/* AEED0 001AEDD0 40080046 */  add.s      $f1, $f1, $f0
/* AEED4 001AEDD4 21188202 */  addu       $3, $20, $2
/* AEED8 001AEDD8 000060C4 */  lwc1       $f0, 0x0($3)
/* AEEDC 001AEDDC 81080046 */  sub.s      $f2, $f1, $f0
/* AEEE0 001AEDE0 003F023C */  lui        $2, (0x3F000000 >> 16)
/* AEEE4 001AEDE4 00008244 */  mtc1       $2, $f0
/* AEEE8 001AEDE8 00000000 */  nop
/* AEEEC 001AEDEC 42000346 */  mul.s      $f1, $f0, $f3
/* AEEF0 001AEDF0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AEEF4 001AEDF4 00008244 */  mtc1       $2, $f0
/* AEEF8 001AEDF8 00000000 */  nop
/* AEEFC 001AEDFC 00010146 */  add.s      $f4, $f0, $f1
/* AEF00 001AEE00 03100446 */  div.s      $f0, $f2, $f4
/* AEF04 001AEE04 000460E4 */  swc1       $f0, 0x400($3)
/* AEF08 001AEE08 000D828E */  lw         $2, 0xD00($20)
/* AEF0C 001AEE0C 21100202 */  addu       $2, $16, $2
/* AEF10 001AEE10 00110200 */  sll        $2, $2, 4
/* AEF14 001AEE14 040061C6 */  lwc1       $f1, 0x4($19)
/* AEF18 001AEE18 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* AEF1C 001AEE1C 02000346 */  mul.s      $f0, $f0, $f3
/* AEF20 001AEE20 40080046 */  add.s      $f1, $f1, $f0
/* AEF24 001AEE24 21105400 */  addu       $2, $2, $20
/* AEF28 001AEE28 040040C4 */  lwc1       $f0, 0x4($2)
/* AEF2C 001AEE2C 01080046 */  sub.s      $f0, $f1, $f0
/* AEF30 001AEE30 03000446 */  div.s      $f0, $f0, $f4
/* AEF34 001AEE34 040440E4 */  swc1       $f0, 0x404($2)
/* AEF38 001AEE38 000D828E */  lw         $2, 0xD00($20)
/* AEF3C 001AEE3C 21100202 */  addu       $2, $16, $2
/* AEF40 001AEE40 00110200 */  sll        $2, $2, 4
/* AEF44 001AEE44 080061C6 */  lwc1       $f1, 0x8($19)
/* AEF48 001AEE48 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* AEF4C 001AEE4C 02000346 */  mul.s      $f0, $f0, $f3
/* AEF50 001AEE50 40080046 */  add.s      $f1, $f1, $f0
/* AEF54 001AEE54 21105400 */  addu       $2, $2, $20
/* AEF58 001AEE58 080040C4 */  lwc1       $f0, 0x8($2)
/* AEF5C 001AEE5C 01080046 */  sub.s      $f0, $f1, $f0
/* AEF60 001AEE60 03000446 */  div.s      $f0, $f0, $f4
/* AEF64 001AEE64 080440E4 */  swc1       $f0, 0x408($2)
/* AEF68 001AEE68 000D828E */  lw         $2, 0xD00($20)
/* AEF6C 001AEE6C 21100202 */  addu       $2, $16, $2
/* AEF70 001AEE70 80100200 */  sll        $2, $2, 2
/* AEF74 001AEE74 21105400 */  addu       $2, $2, $20
/* AEF78 001AEE78 000C40AC */  sw         $0, 0xC00($2)
/* AEF7C 001AEE7C BE11040C */  jal        rand
/* AEF80 001AEE80 00000000 */   nop
/* AEF84 001AEE84 00008244 */  mtc1       $2, $f0
/* AEF88 001AEE88 00000000 */  nop
/* AEF8C 001AEE8C 20008046 */  cvt.s.w    $f0, $f0
/* AEF90 001AEE90 4040023C */  lui        $2, (0x40400000 >> 16)
/* AEF94 001AEE94 00188244 */  mtc1       $2, $f3
/* AEF98 001AEE98 00000000 */  nop
/* AEF9C 001AEE9C 42180046 */  mul.s      $f1, $f3, $f0
/* AEFA0 001AEEA0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* AEFA4 001AEEA4 00008244 */  mtc1       $2, $f0
/* AEFA8 001AEEA8 00000000 */  nop
/* AEFAC 001AEEAC 83080046 */  div.s      $f2, $f1, $f0
/* AEFB0 001AEEB0 00009044 */  mtc1       $16, $f0
/* AEFB4 001AEEB4 00000000 */  nop
/* AEFB8 001AEEB8 60008046 */  cvt.s.w    $f1, $f0
/* AEFBC 001AEEBC 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* AEFC0 001AEEC0 02000146 */  mul.s      $f0, $f0, $f1
/* AEFC4 001AEEC4 00180046 */  add.s      $f0, $f3, $f0
/* AEFC8 001AEEC8 00000246 */  add.s      $f0, $f0, $f2
/* AEFCC 001AEECC 000D828E */  lw         $2, 0xD00($20)
/* AEFD0 001AEED0 21100202 */  addu       $2, $16, $2
/* AEFD4 001AEED4 80100200 */  sll        $2, $2, 2
/* AEFD8 001AEED8 21105400 */  addu       $2, $2, $20
/* AEFDC 001AEEDC 000840E4 */  swc1       $f0, 0x800($2)
/* AEFE0 001AEEE0 0041023C */  lui        $2, (0x41000000 >> 16)
/* AEFE4 001AEEE4 00008244 */  mtc1       $2, $f0
/* AEFE8 001AEEE8 00000000 */  nop
/* AEFEC 001AEEEC 42000146 */  mul.s      $f1, $f0, $f1
/* AEFF0 001AEEF0 3443023C */  lui        $2, (0x43340000 >> 16)
/* AEFF4 001AEEF4 00008244 */  mtc1       $2, $f0
/* AEFF8 001AEEF8 00000000 */  nop
/* AEFFC 001AEEFC 01000146 */  sub.s      $f0, $f0, $f1
/* AF000 001AEF00 000D828E */  lw         $2, 0xD00($20)
/* AF004 001AEF04 21100202 */  addu       $2, $16, $2
/* AF008 001AEF08 80100200 */  sll        $2, $2, 2
/* AF00C 001AEF0C 21105400 */  addu       $2, $2, $20
/* AF010 001AEF10 000940E4 */  swc1       $f0, 0x900($2)
/* AF014 001AEF14 80101000 */  sll        $2, $16, 2
/* AF018 001AEF18 21105400 */  addu       $2, $2, $20
/* AF01C 001AEF1C 000A52AC */  sw         $18, 0xA00($2)
/* AF020 001AEF20 000B51AC */  sw         $17, 0xB00($2)
/* AF024 001AEF24 01001026 */  addiu      $16, $16, 0x1
.L001AEF28:
/* AF028 001AEF28 1800022A */  slti       $2, $16, 0x18
/* AF02C 001AEF2C 9FFF4014 */  bnez       $2, .L001AEDAC
/* AF030 001AEF30 00000000 */   nop
/* AF034 001AEF34 FFFF0224 */  addiu      $2, $0, -0x1
/* AF038 001AEF38 5000BF7B */  lq         $31, 0x50($sp)
/* AF03C 001AEF3C 4000B47B */  lq         $20, 0x40($sp)
/* AF040 001AEF40 3000B37B */  lq         $19, 0x30($sp)
/* AF044 001AEF44 2000B27B */  lq         $18, 0x20($sp)
/* AF048 001AEF48 1000B17B */  lq         $17, 0x10($sp)
/* AF04C 001AEF4C 0000B07B */  lq         $16, 0x0($sp)
/* AF050 001AEF50 7000BD27 */  addiu      $sp, $sp, 0x70
/* AF054 001AEF54 0800E003 */  jr         $31
/* AF058 001AEF58 00000000 */   nop
/* AF05C 001AEF5C 00000000 */  nop
