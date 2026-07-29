.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetVillagerInfo__Fi
/* 08B420 0018B320 04008004 */  bltz        $4, .L0018B334
/* 08B424 0018B324 00000000 */   nop
/* 08B428 0018B328 10008228 */  slti        $2, $4, 0x10
/* 08B42C 0018B32C 04004014 */  bnez        $2, .L0018B340
/* 08B430 0018B330 00000000 */   nop
.L0018B334:
/* 08B434 0018B334 28160070 */  paddub      $2, $0, $0
/* 08B438 0018B338 07000010 */  b           .L0018B358
/* 08B43C 0018B33C 00000000 */   nop
.L0018B340:
/* 08B440 0018B340 C0100400 */  sll         $2, $4, 3
/* 08B444 0018B344 21104400 */  addu        $2, $2, $4
/* 08B448 0018B348 00190200 */  sll         $3, $2, 4
/* 08B44C 0018B34C D401013C */  lui         $1, %hi(EdEventInfo + 0x1FC)
/* 08B450 0018B350 CCD3228C */  lw          $2, %lo(EdEventInfo + 0x1FC)($1)
/* 08B454 0018B354 21104300 */  addu        $2, $2, $3
.L0018B358:
/* 08B458 0018B358 0800E003 */  jr          $31
/* 08B45C 0018B35C 00000000 */   nop
