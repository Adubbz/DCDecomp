.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__8CTextureFv
/* 030FF0 00130EF0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 030FF4 00130EF4 1000BF7F */  sq          $31, 0x10($29)
/* 030FF8 00130EF8 0000B07F */  sq          $16, 0x0($29)
/* 030FFC 00130EFC 28868070 */  paddub      $16, $4, $0
/* 031000 00130F00 C8C3040C */  jal         Initialize__8CTextureFv
/* 031004 00130F04 00000000 */   nop
/* 031008 00130F08 28160072 */  paddub      $2, $16, $0
/* 03100C 00130F0C 1000BF7B */  lq          $31, 0x10($29)
/* 031010 00130F10 0000B07B */  lq          $16, 0x0($29)
/* 031014 00130F14 2000BD27 */  addiu       $29, $29, 0x20
/* 031018 00130F18 0800E003 */  jr          $31
/* 03101C 00130F1C 00000000 */   nop
