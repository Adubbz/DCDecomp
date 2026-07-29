.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NEXT_EVENT__FP12RS_STACKDATAi
/* 08BC50 0018BB50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08BC54 0018BB54 0000BF7F */  sq          $31, 0x0($29)
/* 08BC58 0018BB58 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BC5C 0018BB5C 00000000 */   nop
/* 08BC60 0018BB60 D401013C */  lui         $1, %hi(EdEventInfo + 0x444)
/* 08BC64 0018BB64 14D622AC */  sw          $2, %lo(EdEventInfo + 0x444)($1)
/* 08BC68 0018BB68 01000224 */  addiu       $2, $0, 0x1
/* 08BC6C 0018BB6C 0000BF7B */  lq          $31, 0x0($29)
/* 08BC70 0018BB70 1000BD27 */  addiu       $29, $29, 0x10
/* 08BC74 0018BB74 0800E003 */  jr          $31
/* 08BC78 0018BB78 00000000 */   nop
/* 08BC7C 0018BB7C 00000000 */  nop
