.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmFadeOut__Fii
/* 5A010 00159F10 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5A014 00159F14 1000BF7F */  sq         $31, 0x10($sp)
/* 5A018 00159F18 0000B07F */  sq         $16, 0x0($sp)
/* 5A01C 00159F1C 28868070 */  paddub     $16, $4, $0
/* 5A020 00159F20 1300001A */  blez       $16, .L00159F70
/* 5A024 00159F24 00000000 */   nop
/* 5A028 00159F28 1C8E85AF */  sw         $5, -0x71E4($gp)
/* 5A02C 00159F2C 7867050C */  jal        SndGetBgmVol__Fv
/* 5A030 00159F30 00000000 */   nop
/* 5A034 00159F34 00008244 */  mtc1       $2, $f0
/* 5A038 00159F38 00000000 */  nop
/* 5A03C 00159F3C 20008046 */  cvt.s.w    $f0, $f0
/* 5A040 00159F40 148E80E7 */  swc1       $f0, -0x71EC($gp)
/* 5A044 00159F44 FFFF0324 */  addiu      $3, $0, -0x1
/* 5A048 00159F48 108E83AF */  sw         $3, -0x71F0($gp)
/* 5A04C 00159F4C 1C8E80C7 */  lwc1       $f0, -0x71E4($gp)
/* 5A050 00159F50 60008046 */  cvt.s.w    $f1, $f0
/* 5A054 00159F54 148E80C7 */  lwc1       $f0, -0x71EC($gp)
/* 5A058 00159F58 41080046 */  sub.s      $f1, $f1, $f0
/* 5A05C 00159F5C 00009044 */  mtc1       $16, $f0
/* 5A060 00159F60 00000000 */  nop
/* 5A064 00159F64 20008046 */  cvt.s.w    $f0, $f0
/* 5A068 00159F68 03080046 */  div.s      $f0, $f1, $f0
/* 5A06C 00159F6C 188E80E7 */  swc1       $f0, -0x71E8($gp)
.L00159F70:
/* 5A070 00159F70 1000BF7B */  lq         $31, 0x10($sp)
/* 5A074 00159F74 0000B07B */  lq         $16, 0x0($sp)
/* 5A078 00159F78 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5A07C 00159F7C 0800E003 */  jr         $31
/* 5A080 00159F80 00000000 */   nop
/* 5A084 00159F84 00000000 */  nop
/* 5A088 00159F88 00000000 */  nop
/* 5A08C 00159F8C 00000000 */  nop
