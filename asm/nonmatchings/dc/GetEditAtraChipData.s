.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetEditAtraChipData__Fii
/* 58F80 00158E80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 58F84 00158E84 0000BF7F */  sq         $31, 0x0($sp)
/* 58F88 00158E88 2800A524 */  addiu      $5, $5, 0x28
/* 58F8C 00158E8C 6063050C */  jal        GetEditAtraData__Fii
/* 58F90 00158E90 00000000 */   nop
/* 58F94 00158E94 0000BF7B */  lq         $31, 0x0($sp)
/* 58F98 00158E98 1000BD27 */  addiu      $sp, $sp, 0x10
/* 58F9C 00158E9C 0800E003 */  jr         $31
/* 58FA0 00158EA0 00000000 */   nop
/* 58FA4 00158EA4 00000000 */  nop
/* 58FA8 00158EA8 00000000 */  nop
/* 58FAC 00158EAC 00000000 */  nop
