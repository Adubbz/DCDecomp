.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetItemFrame__Fi
/* 08B380 0018B280 03008004 */  bltz        $4, .L0018B290
/* 08B384 0018B284 00000000 */   nop
/* 08B388 0018B288 04008018 */  blez        $4, .L0018B29C
/* 08B38C 0018B28C 00000000 */   nop
.L0018B290:
/* 08B390 0018B290 28160070 */  paddub      $2, $0, $0
/* 08B394 0018B294 07000010 */  b           .L0018B2B4
/* 08B398 0018B298 00000000 */   nop
.L0018B29C:
/* 08B39C 0018B29C 80180400 */  sll         $3, $4, 2
/* 08B3A0 0018B2A0 D401023C */  lui         $2, %hi(EdEventInfo + 0x25C)
/* 08B3A4 0018B2A4 2CD44224 */  addiu       $2, $2, %lo(EdEventInfo + 0x25C)
/* 08B3A8 0018B2A8 21104300 */  addu        $2, $2, $3
/* 08B3AC 0018B2AC 0000428C */  lw          $2, 0x0($2)
/* 08B3B0 0018B2B0 00000000 */  nop
.L0018B2B4:
/* 08B3B4 0018B2B4 0800E003 */  jr          $31
/* 08B3B8 0018B2B8 00000000 */   nop
/* 08B3BC 0018B2BC 00000000 */  nop
