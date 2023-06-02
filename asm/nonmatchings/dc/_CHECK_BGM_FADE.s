.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_BGM_FADE__FP12RS_STACKDATAi
/* 960C0 00195FC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 960C4 00195FC4 1000BF7F */  sq         $31, 0x10($sp)
/* 960C8 00195FC8 0000B07F */  sq         $16, 0x0($sp)
/* 960CC 00195FCC 28868070 */  paddub     $16, $4, $0
/* 960D0 00195FD0 2468050C */  jal        SndCheckFade__Fv
/* 960D4 00195FD4 00000000 */   nop
/* 960D8 00195FD8 28260072 */  paddub     $4, $16, $0
/* 960DC 00195FDC 282E4070 */  paddub     $5, $2, $0
/* 960E0 00195FE0 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 960E4 00195FE4 00000000 */   nop
/* 960E8 00195FE8 01000224 */  addiu      $2, $0, 0x1
/* 960EC 00195FEC 1000BF7B */  lq         $31, 0x10($sp)
/* 960F0 00195FF0 0000B07B */  lq         $16, 0x0($sp)
/* 960F4 00195FF4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 960F8 00195FF8 0800E003 */  jr         $31
/* 960FC 00195FFC 00000000 */   nop
