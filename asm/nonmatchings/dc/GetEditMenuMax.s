.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetEditMenuMax__Fv
/* 1103E0 002102E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1103E4 002102E4 1000BF7F */  sq         $31, 0x10($sp)
/* 1103E8 002102E8 0000B07F */  sq         $16, 0x0($sp)
/* 1103EC 002102EC 06001024 */  addiu      $16, $0, 0x6
/* 1103F0 002102F0 58CD080C */  jal        GetGameFlagForManualMenu__Fv
/* 1103F4 002102F4 00000000 */   nop
/* 1103F8 002102F8 02004014 */  bnez       $2, .L00210304
/* 1103FC 002102FC 00000000 */   nop
/* 110400 00210300 FFFF1026 */  addiu      $16, $16, -0x1
.L00210304:
/* 110404 00210304 28160072 */  paddub     $2, $16, $0
/* 110408 00210308 1000BF7B */  lq         $31, 0x10($sp)
/* 11040C 0021030C 0000B07B */  lq         $16, 0x0($sp)
/* 110410 00210310 2000BD27 */  addiu      $sp, $sp, 0x20
/* 110414 00210314 0800E003 */  jr         $31
/* 110418 00210318 00000000 */   nop
/* 11041C 0021031C 00000000 */  nop
