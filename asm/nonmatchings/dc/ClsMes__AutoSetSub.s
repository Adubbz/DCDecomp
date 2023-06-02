.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AutoSetSub__6ClsMesFP10CCharacterP10CCharacterPi
/* 4D0E0 0014CFE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4D0E4 0014CFE4 2000BF7F */  sq         $31, 0x20($sp)
/* 4D0E8 0014CFE8 1000B17F */  sq         $17, 0x10($sp)
/* 4D0EC 0014CFEC 0000B07F */  sq         $16, 0x0($sp)
/* 4D0F0 0014CFF0 288EC070 */  paddub     $17, $6, $0
/* 4D0F4 0014CFF4 2886E070 */  paddub     $16, $7, $0
/* 4D0F8 0014CFF8 2826A070 */  paddub     $4, $5, $0
/* 4D0FC 0014CFFC 282E0072 */  paddub     $5, $16, $0
/* 4D100 0014D000 6032050C */  jal        GetScrPosFromChar__FP10CCharacterPi
/* 4D104 0014D004 00000000 */   nop
/* 4D108 0014D008 28262072 */  paddub     $4, $17, $0
/* 4D10C 0014D00C 08000526 */  addiu      $5, $16, 0x8
/* 4D110 0014D010 6032050C */  jal        GetScrPosFromChar__FP10CCharacterPi
/* 4D114 0014D014 00000000 */   nop
/* 4D118 0014D018 2000BF7B */  lq         $31, 0x20($sp)
/* 4D11C 0014D01C 1000B17B */  lq         $17, 0x10($sp)
/* 4D120 0014D020 0000B07B */  lq         $16, 0x0($sp)
/* 4D124 0014D024 3000BD27 */  addiu      $sp, $sp, 0x30
/* 4D128 0014D028 0800E003 */  jr         $31
/* 4D12C 0014D02C 00000000 */   nop
