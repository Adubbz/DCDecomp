.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AutoRepeatOff__8CGamePadFv
/* 2B9F0 0012B8F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B9F4 0012B8F4 0000BF7F */  sq         $31, 0x0($sp)
/* 2B9F8 0012B8F8 FFFF0524 */  addiu      $5, $0, -0x1
/* 2B9FC 0012B8FC 3CAD040C */  jal        CancelAutoRepeat__8CGamePadFi
/* 2BA00 0012B900 00000000 */   nop
/* 2BA04 0012B904 0000BF7B */  lq         $31, 0x0($sp)
/* 2BA08 0012B908 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2BA0C 0012B90C 0800E003 */  jr         $31
/* 2BA10 0012B910 00000000 */   nop
/* 2BA14 0012B914 00000000 */  nop
/* 2BA18 0012B918 00000000 */  nop
/* 2BA1C 0012B91C 00000000 */  nop
