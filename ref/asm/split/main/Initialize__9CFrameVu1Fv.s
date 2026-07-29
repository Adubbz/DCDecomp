.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__9CFrameVu1Fv
/* 02A330 0012A230 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02A334 0012A234 1000BF7F */  sq          $31, 0x10($29)
/* 02A338 0012A238 0000B07F */  sq          $16, 0x0($29)
/* 02A33C 0012A23C 28868070 */  paddub      $16, $4, $0
/* 02A340 0012A240 5C9F040C */  jal         Initialize__6CFrameFv
/* 02A344 0012A244 00000000 */   nop
/* 02A348 0012A248 600200AE */  sw          $0, 0x260($16)
/* 02A34C 0012A24C 1000BF7B */  lq          $31, 0x10($29)
/* 02A350 0012A250 0000B07B */  lq          $16, 0x0($29)
/* 02A354 0012A254 2000BD27 */  addiu       $29, $29, 0x20
/* 02A358 0012A258 0800E003 */  jr          $31
/* 02A35C 0012A25C 00000000 */   nop
