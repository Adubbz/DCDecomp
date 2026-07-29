.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdResumeEvent__Fv
/* 0978B0 001977B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0978B4 001977B4 0000BF7F */  sq          $31, 0x0($29)
/* 0978B8 001977B8 D501023C */  lui         $2, %hi(EdEventScript)
/* 0978BC 001977BC 30A44424 */  addiu       $4, $2, %lo(EdEventScript)
/* 0978C0 001977C0 90F7080C */  jal         resume__10CRunScriptFv
/* 0978C4 001977C4 00000000 */   nop
/* 0978C8 001977C8 01000224 */  addiu       $2, $0, 0x1
/* 0978CC 001977CC 0000BF7B */  lq          $31, 0x0($29)
/* 0978D0 001977D0 1000BD27 */  addiu       $29, $29, 0x10
/* 0978D4 001977D4 0800E003 */  jr          $31
/* 0978D8 001977D8 00000000 */   nop
/* 0978DC 001977DC 00000000 */  nop
