.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _MAP_JUMP_BGM_STOP__FP12RS_STACKDATAi
/* 8C220 0018C120 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C224 0018C124 0000BF7F */  sq         $31, 0x0($sp)
/* 8C228 0018C128 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C22C 0018C12C 00000000 */   nop
/* 8C230 0018C130 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8C234 0018C134 00D222AC */  sw         $2, -0x2E00($at)
/* 8C238 0018C138 01000224 */  addiu      $2, $0, 0x1
/* 8C23C 0018C13C 0000BF7B */  lq         $31, 0x0($sp)
/* 8C240 0018C140 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C244 0018C144 0800E003 */  jr         $31
/* 8C248 0018C148 00000000 */   nop
/* 8C24C 0018C14C 00000000 */  nop
