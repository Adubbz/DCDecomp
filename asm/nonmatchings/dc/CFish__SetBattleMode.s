.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBattleMode__5CFishFv
/* 140E40 00240D40 0B000324 */  addiu      $3, $0, 0xB
/* 140E44 00240D44 4C0083AC */  sw         $3, 0x4C($4)
/* 140E48 00240D48 500083AC */  sw         $3, 0x50($4)
/* 140E4C 00240D4C 0800E003 */  jr         $31
/* 140E50 00240D50 00000000 */   nop
/* 140E54 00240D54 00000000 */  nop
/* 140E58 00240D58 00000000 */  nop
/* 140E5C 00240D5C 00000000 */  nop
