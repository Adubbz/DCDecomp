.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EXIT_FISHING__FP12RS_STACKDATAi
/* 96D80 00196C80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96D84 00196C84 0000BF7F */  sq         $31, 0x0($sp)
/* 96D88 00196C88 3CA4060C */  jal        FishingExit__Fv
/* 96D8C 00196C8C 00000000 */   nop
/* 96D90 00196C90 01000224 */  addiu      $2, $0, 0x1
/* 96D94 00196C94 0000BF7B */  lq         $31, 0x0($sp)
/* 96D98 00196C98 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96D9C 00196C9C 0800E003 */  jr         $31
/* 96DA0 00196CA0 00000000 */   nop
/* 96DA4 00196CA4 00000000 */  nop
/* 96DA8 00196CA8 00000000 */  nop
/* 96DAC 00196CAC 00000000 */  nop
