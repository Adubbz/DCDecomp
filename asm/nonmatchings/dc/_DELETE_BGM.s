.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DELETE_BGM__FP12RS_STACKDATAi
/* 95DC0 00195CC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95DC4 00195CC4 0000BF7F */  sq         $31, 0x0($sp)
/* 95DC8 00195CC8 E866050C */  jal        SndBgmStop__Fv
/* 95DCC 00195CCC 00000000 */   nop
/* 95DD0 00195CD0 4C66050C */  jal        SndBgmInit__Fv
/* 95DD4 00195CD4 00000000 */   nop
/* 95DD8 00195CD8 01000224 */  addiu      $2, $0, 0x1
/* 95DDC 00195CDC 0000BF7B */  lq         $31, 0x0($sp)
/* 95DE0 00195CE0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95DE4 00195CE4 0800E003 */  jr         $31
/* 95DE8 00195CE8 00000000 */   nop
/* 95DEC 00195CEC 00000000 */  nop
