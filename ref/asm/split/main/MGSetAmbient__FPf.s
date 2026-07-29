.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetAmbient__FPf
/* 02DE00 0012DD00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02DE04 0012DD04 0000BF7F */  sq          $31, 0x0($29)
/* 02DE08 0012DD08 282E8070 */  paddub      $5, $4, $0
/* 02DE0C 0012DD0C C701023C */  lui         $2, %hi(mgRenderInfo + 0x190)
/* 02DE10 0012DD10 B0564424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x190)
/* 02DE14 0012DD14 0C86040C */  jal         sceVu0CopyVector
/* 02DE18 0012DD18 00000000 */   nop
/* 02DE1C 0012DD1C 0000BF7B */  lq          $31, 0x0($29)
/* 02DE20 0012DD20 1000BD27 */  addiu       $29, $29, 0x10
/* 02DE24 0012DD24 0800E003 */  jr          $31
/* 02DE28 0012DD28 00000000 */   nop
/* 02DE2C 0012DD2C 00000000 */  nop
