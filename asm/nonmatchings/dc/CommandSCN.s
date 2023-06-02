.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSCN__FPPv
/* 74BE0 00174AE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 74BE4 00174AE4 0000BF7F */  sq         $31, 0x0($sp)
/* 74BE8 00174AE8 0000858C */  lw         $5, 0x0($4)
/* 74BEC 00174AEC C08F848F */  lw         $4, -0x7040($gp)
/* 74BF0 00174AF0 5A15040C */  jal        strcpy
/* 74BF4 00174AF4 00000000 */   nop
/* 74BF8 00174AF8 0000BF7B */  lq         $31, 0x0($sp)
/* 74BFC 00174AFC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 74C00 00174B00 0800E003 */  jr         $31
/* 74C04 00174B04 00000000 */   nop
/* 74C08 00174B08 00000000 */  nop
/* 74C0C 00174B0C 00000000 */  nop
