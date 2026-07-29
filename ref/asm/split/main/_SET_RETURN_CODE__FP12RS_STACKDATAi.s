.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_RETURN_CODE__FP12RS_STACKDATAi
/* 08BC20 0018BB20 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08BC24 0018BB24 0000BF7F */  sq          $31, 0x0($29)
/* 08BC28 0018BB28 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BC2C 0018BB2C 00000000 */   nop
/* 08BC30 0018BB30 D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 08BC34 0018BB34 18D622AC */  sw          $2, %lo(EdEventInfo + 0x448)($1)
/* 08BC38 0018BB38 01000224 */  addiu       $2, $0, 0x1
/* 08BC3C 0018BB3C 0000BF7B */  lq          $31, 0x0($29)
/* 08BC40 0018BB40 1000BD27 */  addiu       $29, $29, 0x10
/* 08BC44 0018BB44 0800E003 */  jr          $31
/* 08BC48 0018BB48 00000000 */   nop
/* 08BC4C 0018BB4C 00000000 */  nop
