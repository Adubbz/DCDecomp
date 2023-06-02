.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopVibration__8CGamePadFv
/* 2BAC0 0012B9C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2BAC4 0012B9C4 1000BF7F */  sq         $31, 0x10($sp)
/* 2BAC8 0012B9C8 0000B07F */  sq         $16, 0x0($sp)
/* 2BACC 0012B9CC 28868070 */  paddub     $16, $4, $0
/* 2BAD0 0012B9D0 282E0070 */  paddub     $5, $0, $0
/* 2BAD4 0012B9D4 28360070 */  paddub     $6, $0, $0
/* 2BAD8 0012B9D8 283E0070 */  paddub     $7, $0, $0
/* 2BADC 0012B9DC 50AE040C */  jal        SetVibration__8CGamePadFiii
/* 2BAE0 0012B9E0 00000000 */   nop
/* 2BAE4 0012B9E4 28260072 */  paddub     $4, $16, $0
/* 2BAE8 0012B9E8 01000524 */  addiu      $5, $0, 0x1
/* 2BAEC 0012B9EC 28360070 */  paddub     $6, $0, $0
/* 2BAF0 0012B9F0 283E0070 */  paddub     $7, $0, $0
/* 2BAF4 0012B9F4 50AE040C */  jal        SetVibration__8CGamePadFiii
/* 2BAF8 0012B9F8 00000000 */   nop
/* 2BAFC 0012B9FC 28260072 */  paddub     $4, $16, $0
/* 2BB00 0012BA00 50AC040C */  jal        Step__8CGamePadFv
/* 2BB04 0012BA04 00000000 */   nop
/* 2BB08 0012BA08 1000BF7B */  lq         $31, 0x10($sp)
/* 2BB0C 0012BA0C 0000B07B */  lq         $16, 0x0($sp)
/* 2BB10 0012BA10 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2BB14 0012BA14 0800E003 */  jr         $31
/* 2BB18 0012BA18 00000000 */   nop
/* 2BB1C 0012BA1C 00000000 */  nop
