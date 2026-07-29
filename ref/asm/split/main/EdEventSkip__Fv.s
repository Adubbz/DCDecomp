.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdEventSkip__Fv
/* 0978E0 001977E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0978E4 001977E4 0000BF7F */  sq          $31, 0x0($29)
/* 0978E8 001977E8 D501023C */  lui         $2, %hi(EdEventScript)
/* 0978EC 001977EC 30A44424 */  addiu       $4, $2, %lo(EdEventScript)
/* 0978F0 001977F0 14F8080C */  jal         skip__10CRunScriptFv
/* 0978F4 001977F4 00000000 */   nop
/* 0978F8 001977F8 01000224 */  addiu       $2, $0, 0x1
/* 0978FC 001977FC 0000BF7B */  lq          $31, 0x0($29)
/* 097900 00197800 1000BD27 */  addiu       $29, $29, 0x10
/* 097904 00197804 0800E003 */  jr          $31
/* 097908 00197808 00000000 */   nop
/* 09790C 0019780C 00000000 */  nop
