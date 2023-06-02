.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SE_SetPan__6CSoundFiiii
/* 45BA0 00145AA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 45BA4 00145AA4 0000BF7F */  sq         $31, 0x0($sp)
/* 45BA8 00145AA8 2856E070 */  paddub     $10, $7, $0
/* 45BAC 00145AAC 284E0071 */  paddub     $9, $8, $0
/* 45BB0 00145AB0 80180600 */  sll        $3, $6, 2
/* 45BB4 00145AB4 CF01023C */  lui        $2, %hi(se_inf_tbl)
/* 45BB8 00145AB8 509F4224 */  addiu      $2, $2, %lo(se_inf_tbl)
/* 45BBC 00145ABC 21104300 */  addu       $2, $2, $3
/* 45BC0 00145AC0 00004680 */  lb         $6, 0x0($2)
/* 45BC4 00145AC4 CF01023C */  lui        $2, %hi(D_1CE9F51)
/* 45BC8 00145AC8 519F4224 */  addiu      $2, $2, %lo(D_1CE9F51)
/* 45BCC 00145ACC 21104300 */  addu       $2, $2, $3
/* 45BD0 00145AD0 00004780 */  lb         $7, 0x0($2)
/* 45BD4 00145AD4 28464071 */  paddub     $8, $10, $0
/* 45BD8 00145AD8 6416050C */  jal        SE_SetPan__6CSoundFiiiii
/* 45BDC 00145ADC 00000000 */   nop
/* 45BE0 00145AE0 0000BF7B */  lq         $31, 0x0($sp)
/* 45BE4 00145AE4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 45BE8 00145AE8 0800E003 */  jr         $31
/* 45BEC 00145AEC 00000000 */   nop
