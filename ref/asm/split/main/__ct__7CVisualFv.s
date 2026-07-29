.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__7CVisualFv
/* 034C60 00134B60 E0FFBD27 */  addiu       $29, $29, -0x20
/* 034C64 00134B64 1000BF7F */  sq          $31, 0x10($29)
/* 034C68 00134B68 0000B07F */  sq          $16, 0x0($29)
/* 034C6C 00134B6C 28868070 */  paddub      $16, $4, $0
/* 034C70 00134B70 2A00023C */  lui         $2, %hi(__vt__7CVisual)
/* 034C74 00134B74 68114224 */  addiu       $2, $2, %lo(__vt__7CVisual)
/* 034C78 00134B78 080082AC */  sw          $2, 0x8($4)
/* 034C7C 00134B7C 0800198E */  lw          $25, 0x8($16)
/* 034C80 00134B80 0800398F */  lw          $25, 0x8($25)
/* 034C84 00134B84 09F82003 */  jalr        $25
/* 034C88 00134B88 00000000 */   nop
/* 034C8C 00134B8C 28160072 */  paddub      $2, $16, $0
/* 034C90 00134B90 1000BF7B */  lq          $31, 0x10($29)
/* 034C94 00134B94 0000B07B */  lq          $16, 0x0($29)
/* 034C98 00134B98 2000BD27 */  addiu       $29, $29, 0x20
/* 034C9C 00134B9C 0800E003 */  jr          $31
/* 034CA0 00134BA0 00000000 */   nop
/* 034CA4 00134BA4 00000000 */  nop
/* 034CA8 00134BA8 00000000 */  nop
/* 034CAC 00134BAC 00000000 */  nop
