.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STOP_BGM__FP12RS_STACKDATAi
/* 95E20 00195D20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95E24 00195D24 0000BF7F */  sq         $31, 0x0($sp)
/* 95E28 00195D28 E866050C */  jal        SndBgmStop__Fv
/* 95E2C 00195D2C 00000000 */   nop
/* 95E30 00195D30 01000224 */  addiu      $2, $0, 0x1
/* 95E34 00195D34 0000BF7B */  lq         $31, 0x0($sp)
/* 95E38 00195D38 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95E3C 00195D3C 0800E003 */  jr         $31
/* 95E40 00195D40 00000000 */   nop
/* 95E44 00195D44 00000000 */  nop
/* 95E48 00195D48 00000000 */  nop
/* 95E4C 00195D4C 00000000 */  nop
