.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SSET_MAP_FLAG__FP12RS_STACKDATAi
/* 95260 00195160 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95264 00195164 2000BF7F */  sq         $31, 0x20($sp)
/* 95268 00195168 1000B17F */  sq         $17, 0x10($sp)
/* 9526C 0019516C 0000B07F */  sq         $16, 0x0($sp)
/* 95270 00195170 08009124 */  addiu      $17, $4, 0x8
/* 95274 00195174 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95278 00195178 00000000 */   nop
/* 9527C 0019517C 28864070 */  paddub     $16, $2, $0
/* 95280 00195180 28262072 */  paddub     $4, $17, $0
/* 95284 00195184 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95288 00195188 00000000 */   nop
/* 9528C 0019518C 2B100200 */  sltu       $2, $0, $2
/* 95290 00195190 01004238 */  xori       $2, $2, 0x1
/* 95294 00195194 FF004530 */  andi       $5, $2, 0xFF
/* 95298 00195198 28260072 */  paddub     $4, $16, $0
/* 9529C 0019519C 24E0050C */  jal        EdSetMapFlag__Fii
/* 952A0 001951A0 00000000 */   nop
/* 952A4 001951A4 01000224 */  addiu      $2, $0, 0x1
/* 952A8 001951A8 2000BF7B */  lq         $31, 0x20($sp)
/* 952AC 001951AC 1000B17B */  lq         $17, 0x10($sp)
/* 952B0 001951B0 0000B07B */  lq         $16, 0x0($sp)
/* 952B4 001951B4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 952B8 001951B8 0800E003 */  jr         $31
/* 952BC 001951BC 00000000 */   nop
