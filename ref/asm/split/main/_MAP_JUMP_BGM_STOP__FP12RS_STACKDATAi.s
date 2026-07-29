.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _MAP_JUMP_BGM_STOP__FP12RS_STACKDATAi
/* 08C220 0018C120 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C224 0018C124 0000BF7F */  sq          $31, 0x0($29)
/* 08C228 0018C128 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C22C 0018C12C 00000000 */   nop
/* 08C230 0018C130 D401013C */  lui         $1, %hi(EdEventInfo + 0x30)
/* 08C234 0018C134 00D222AC */  sw          $2, %lo(EdEventInfo + 0x30)($1)
/* 08C238 0018C138 01000224 */  addiu       $2, $0, 0x1
/* 08C23C 0018C13C 0000BF7B */  lq          $31, 0x0($29)
/* 08C240 0018C140 1000BD27 */  addiu       $29, $29, 0x10
/* 08C244 0018C144 0800E003 */  jr          $31
/* 08C248 0018C148 00000000 */   nop
/* 08C24C 0018C14C 00000000 */  nop
