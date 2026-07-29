.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetActSeq__Fi
/* 08B190 0018B090 04008004 */  bltz        $4, .L0018B0A4
/* 08B194 0018B094 00000000 */   nop
/* 08B198 0018B098 0A008228 */  slti        $2, $4, 0xA
/* 08B19C 0018B09C 04004014 */  bnez        $2, .L0018B0B0
/* 08B1A0 0018B0A0 00000000 */   nop
.L0018B0A4:
/* 08B1A4 0018B0A4 28160070 */  paddub      $2, $0, $0
/* 08B1A8 0018B0A8 09000010 */  b           .L0018B0D0
/* 08B1AC 0018B0AC 00000000 */   nop
.L0018B0B0:
/* 08B1B0 0018B0B0 40100400 */  sll         $2, $4, 1
/* 08B1B4 0018B0B4 21104400 */  addu        $2, $2, $4
/* 08B1B8 0018B0B8 80100200 */  sll         $2, $2, 2
/* 08B1BC 0018B0BC 21104400 */  addu        $2, $2, $4
/* 08B1C0 0018B0C0 00190200 */  sll         $3, $2, 4
/* 08B1C4 0018B0C4 D401023C */  lui         $2, %hi(ActSeq)
/* 08B1C8 0018B0C8 50114224 */  addiu       $2, $2, %lo(ActSeq)
/* 08B1CC 0018B0CC 21104300 */  addu        $2, $2, $3
.L0018B0D0:
/* 08B1D0 0018B0D0 0800E003 */  jr          $31
/* 08B1D4 0018B0D4 00000000 */   nop
/* 08B1D8 0018B0D8 00000000 */  nop
/* 08B1DC 0018B0DC 00000000 */  nop
