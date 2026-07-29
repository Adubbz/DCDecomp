.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndBgmFadeIn__Fiii
/* 059F40 00159E40 D0FFBD27 */  addiu       $29, $29, -0x30
/* 059F44 00159E44 2000BF7F */  sq          $31, 0x20($29)
/* 059F48 00159E48 1000B17F */  sq          $17, 0x10($29)
/* 059F4C 00159E4C 0000B07F */  sq          $16, 0x0($29)
/* 059F50 00159E50 288E8070 */  paddub      $17, $4, $0
/* 059F54 00159E54 2886C070 */  paddub      $16, $6, $0
/* 059F58 00159E58 2500201A */  blez        $17, .L00159EF0
/* 059F5C 00159E5C 00000000 */   nop
/* 059F60 00159E60 0400A104 */  bgez        $5, .L00159E74
/* 059F64 00159E64 00000000 */   nop
/* 059F68 00159E68 7C67050C */  jal         SndGetDefaultBgmVol__Fv
/* 059F6C 00159E6C 00000000 */   nop
/* 059F70 00159E70 282E4070 */  paddub      $5, $2, $0
.L00159E74:
/* 059F74 00159E74 1C8E85AF */  sw          $5, -0x71E4($28)
/* 059F78 00159E78 04000106 */  bgez        $16, .L00159E8C
/* 059F7C 00159E7C 00000000 */   nop
/* 059F80 00159E80 7867050C */  jal         SndGetBgmVol__Fv
/* 059F84 00159E84 00000000 */   nop
/* 059F88 00159E88 28864070 */  paddub      $16, $2, $0
.L00159E8C:
/* 059F8C 00159E8C 7C67050C */  jal         SndGetDefaultBgmVol__Fv
/* 059F90 00159E90 00000000 */   nop
/* 059F94 00159E94 16000212 */  beq         $16, $2, .L00159EF0
/* 059F98 00159E98 00000000 */   nop
/* 059F9C 00159E9C 7C67050C */  jal         SndGetDefaultBgmVol__Fv
/* 059FA0 00159EA0 00000000 */   nop
/* 059FA4 00159EA4 00008244 */  mtc1        $2, $f0
/* 059FA8 00159EA8 00000000 */  nop
/* 059FAC 00159EAC 60008046 */  cvt.s.w     $f1, $f0
/* 059FB0 00159EB0 00009044 */  mtc1        $16, $f0
/* 059FB4 00159EB4 00000000 */  nop
/* 059FB8 00159EB8 20008046 */  cvt.s.w     $f0, $f0
/* 059FBC 00159EBC 03000146 */  div.s       $f0, $f0, $f1
/* 059FC0 00159EC0 148E80E7 */  swc1        $f0, -0x71EC($28)
/* 059FC4 00159EC4 01000324 */  addiu       $3, $0, 0x1
/* 059FC8 00159EC8 108E83AF */  sw          $3, -0x71F0($28)
/* 059FCC 00159ECC 1C8E80C7 */  lwc1        $f0, -0x71E4($28)
/* 059FD0 00159ED0 60008046 */  cvt.s.w     $f1, $f0
/* 059FD4 00159ED4 148E80C7 */  lwc1        $f0, -0x71EC($28)
/* 059FD8 00159ED8 41080046 */  sub.s       $f1, $f1, $f0
/* 059FDC 00159EDC 00009144 */  mtc1        $17, $f0
/* 059FE0 00159EE0 00000000 */  nop
/* 059FE4 00159EE4 20008046 */  cvt.s.w     $f0, $f0
/* 059FE8 00159EE8 03080046 */  div.s       $f0, $f1, $f0
/* 059FEC 00159EEC 188E80E7 */  swc1        $f0, -0x71E8($28)
.L00159EF0:
/* 059FF0 00159EF0 2000BF7B */  lq          $31, 0x20($29)
/* 059FF4 00159EF4 1000B17B */  lq          $17, 0x10($29)
/* 059FF8 00159EF8 0000B07B */  lq          $16, 0x0($29)
/* 059FFC 00159EFC 3000BD27 */  addiu       $29, $29, 0x30
/* 05A000 00159F00 0800E003 */  jr          $31
/* 05A004 00159F04 00000000 */   nop
/* 05A008 00159F08 00000000 */  nop
/* 05A00C 00159F0C 00000000 */  nop
