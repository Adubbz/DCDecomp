.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__10CVisualVu1Fv
/* 035000 00134F00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 035004 00134F04 1000BF7F */  sq          $31, 0x10($29)
/* 035008 00134F08 0000B07F */  sq          $16, 0x0($29)
/* 03500C 00134F0C 28868070 */  paddub      $16, $4, $0
/* 035010 00134F10 D8D2040C */  jal         __ct__7CVisualFv
/* 035014 00134F14 00000000 */   nop
/* 035018 00134F18 2A00023C */  lui         $2, %hi(__vt__10CVisualVu1)
/* 03501C 00134F1C C0114224 */  addiu       $2, $2, %lo(__vt__10CVisualVu1)
/* 035020 00134F20 080002AE */  sw          $2, 0x8($16)
/* 035024 00134F24 28260072 */  paddub      $4, $16, $0
/* 035028 00134F28 0800198E */  lw          $25, 0x8($16)
/* 03502C 00134F2C 0800398F */  lw          $25, 0x8($25)
/* 035030 00134F30 09F82003 */  jalr        $25
/* 035034 00134F34 00000000 */   nop
/* 035038 00134F38 28160072 */  paddub      $2, $16, $0
/* 03503C 00134F3C 1000BF7B */  lq          $31, 0x10($29)
/* 035040 00134F40 0000B07B */  lq          $16, 0x0($29)
/* 035044 00134F44 2000BD27 */  addiu       $29, $29, 0x20
/* 035048 00134F48 0800E003 */  jr          $31
/* 03504C 00134F4C 00000000 */   nop
