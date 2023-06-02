.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_BGM_VOL__FP12RS_STACKDATAi
/* 95EB0 00195DB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95EB4 00195DB4 1000BF7F */  sq         $31, 0x10($sp)
/* 95EB8 00195DB8 0000B07F */  sq         $16, 0x0($sp)
/* 95EBC 00195DBC 28868070 */  paddub     $16, $4, $0
/* 95EC0 00195DC0 7867050C */  jal        SndGetBgmVol__Fv
/* 95EC4 00195DC4 00000000 */   nop
/* 95EC8 00195DC8 28260072 */  paddub     $4, $16, $0
/* 95ECC 00195DCC 282E4070 */  paddub     $5, $2, $0
/* 95ED0 00195DD0 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 95ED4 00195DD4 00000000 */   nop
/* 95ED8 00195DD8 01000224 */  addiu      $2, $0, 0x1
/* 95EDC 00195DDC 1000BF7B */  lq         $31, 0x10($sp)
/* 95EE0 00195DE0 0000B07B */  lq         $16, 0x0($sp)
/* 95EE4 00195DE4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95EE8 00195DE8 0800E003 */  jr         $31
/* 95EEC 00195DEC 00000000 */   nop
