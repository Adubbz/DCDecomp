.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNPC__Fi
/* 08B2C0 0018B1C0 06008004 */  bltz        $4, .L0018B1DC
/* 08B2C4 0018B1C4 00000000 */   nop
/* 08B2C8 0018B1C8 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F8)
/* 08B2CC 0018B1CC C8D3228C */  lw          $2, %lo(EdEventInfo + 0x1F8)($1)
/* 08B2D0 0018B1D0 2A108200 */  slt         $2, $4, $2
/* 08B2D4 0018B1D4 04004014 */  bnez        $2, .L0018B1E8
/* 08B2D8 0018B1D8 00000000 */   nop
.L0018B1DC:
/* 08B2DC 0018B1DC 28160070 */  paddub      $2, $0, $0
/* 08B2E0 0018B1E0 09000010 */  b           .L0018B208
/* 08B2E4 0018B1E4 00000000 */   nop
.L0018B1E8:
/* 08B2E8 0018B1E8 40110400 */  sll         $2, $4, 5
/* 08B2EC 0018B1EC 21184400 */  addu        $3, $2, $4
/* 08B2F0 0018B1F0 80100300 */  sll         $2, $3, 2
/* 08B2F4 0018B1F4 21106200 */  addu        $2, $3, $2
/* 08B2F8 0018B1F8 40190200 */  sll         $3, $2, 5
/* 08B2FC 0018B1FC D401013C */  lui         $1, %hi(EdEventInfo + 0x58)
/* 08B300 0018B200 28D2228C */  lw          $2, %lo(EdEventInfo + 0x58)($1)
/* 08B304 0018B204 21104300 */  addu        $2, $2, $3
.L0018B208:
/* 08B308 0018B208 0800E003 */  jr          $31
/* 08B30C 0018B20C 00000000 */   nop
