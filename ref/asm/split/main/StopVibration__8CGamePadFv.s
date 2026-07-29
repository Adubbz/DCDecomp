.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StopVibration__8CGamePadFv
/* 02BAC0 0012B9C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02BAC4 0012B9C4 1000BF7F */  sq          $31, 0x10($29)
/* 02BAC8 0012B9C8 0000B07F */  sq          $16, 0x0($29)
/* 02BACC 0012B9CC 28868070 */  paddub      $16, $4, $0
/* 02BAD0 0012B9D0 282E0070 */  paddub      $5, $0, $0
/* 02BAD4 0012B9D4 28360070 */  paddub      $6, $0, $0
/* 02BAD8 0012B9D8 283E0070 */  paddub      $7, $0, $0
/* 02BADC 0012B9DC 50AE040C */  jal         SetVibration__8CGamePadFiii
/* 02BAE0 0012B9E0 00000000 */   nop
/* 02BAE4 0012B9E4 28260072 */  paddub      $4, $16, $0
/* 02BAE8 0012B9E8 01000524 */  addiu       $5, $0, 0x1
/* 02BAEC 0012B9EC 28360070 */  paddub      $6, $0, $0
/* 02BAF0 0012B9F0 283E0070 */  paddub      $7, $0, $0
/* 02BAF4 0012B9F4 50AE040C */  jal         SetVibration__8CGamePadFiii
/* 02BAF8 0012B9F8 00000000 */   nop
/* 02BAFC 0012B9FC 28260072 */  paddub      $4, $16, $0
/* 02BB00 0012BA00 50AC040C */  jal         Step__8CGamePadFv
/* 02BB04 0012BA04 00000000 */   nop
/* 02BB08 0012BA08 1000BF7B */  lq          $31, 0x10($29)
/* 02BB0C 0012BA0C 0000B07B */  lq          $16, 0x0($29)
/* 02BB10 0012BA10 2000BD27 */  addiu       $29, $29, 0x20
/* 02BB14 0012BA14 0800E003 */  jr          $31
/* 02BB18 0012BA18 00000000 */   nop
/* 02BB1C 0012BA1C 00000000 */  nop
