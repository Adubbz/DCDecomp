.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__10CCharacterFfff
/* 390B0 00138FB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 390B4 00138FB4 2000BF7F */  sq         $31, 0x20($sp)
/* 390B8 00138FB8 1000B07F */  sq         $16, 0x10($sp)
/* 390BC 00138FBC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 390C0 00138FC0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 390C4 00138FC4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 390C8 00138FC8 28868070 */  paddub     $16, $4, $0
/* 390CC 00138FCC 86650046 */  mov.s      $f22, $f12
/* 390D0 00138FD0 466D0046 */  mov.s      $f21, $f13
/* 390D4 00138FD4 06750046 */  mov.s      $f20, $f14
/* 390D8 00138FD8 345B050C */  jal        SetPosition__7CObjectFfff
/* 390DC 00138FDC 00000000 */   nop
/* 390E0 00138FE0 BC00048E */  lw         $4, 0xBC($16)
/* 390E4 00138FE4 06008010 */  beqz       $4, .L00139000
/* 390E8 00138FE8 00000000 */   nop
/* 390EC 00138FEC 06B30046 */  mov.s      $f12, $f22
/* 390F0 00138FF0 46AB0046 */  mov.s      $f13, $f21
/* 390F4 00138FF4 86A30046 */  mov.s      $f14, $f20
/* 390F8 00138FF8 A09F040C */  jal        SetPosition__6CFrameFfff
/* 390FC 00138FFC 00000000 */   nop
.L00139000:
/* 39100 00139000 C000048E */  lw         $4, 0xC0($16)
/* 39104 00139004 06008010 */  beqz       $4, .L00139020
/* 39108 00139008 00000000 */   nop
/* 3910C 0013900C 06B30046 */  mov.s      $f12, $f22
/* 39110 00139010 46AB0046 */  mov.s      $f13, $f21
/* 39114 00139014 86A30046 */  mov.s      $f14, $f20
/* 39118 00139018 A09F040C */  jal        SetPosition__6CFrameFfff
/* 3911C 0013901C 00000000 */   nop
.L00139020:
/* 39120 00139020 2000BF7B */  lq         $31, 0x20($sp)
/* 39124 00139024 1000B07B */  lq         $16, 0x10($sp)
/* 39128 00139028 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 3912C 0013902C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 39130 00139030 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 39134 00139034 3000BD27 */  addiu      $sp, $sp, 0x30
/* 39138 00139038 0800E003 */  jr         $31
/* 3913C 0013903C 00000000 */   nop
