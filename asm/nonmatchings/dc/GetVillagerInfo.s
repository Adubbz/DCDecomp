.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVillagerInfo__Fi
/* 8B420 0018B320 04008004 */  bltz       $4, .L0018B334
/* 8B424 0018B324 00000000 */   nop
/* 8B428 0018B328 10008228 */  slti       $2, $4, 0x10
/* 8B42C 0018B32C 04004014 */  bnez       $2, .L0018B340
/* 8B430 0018B330 00000000 */   nop
.L0018B334:
/* 8B434 0018B334 28160070 */  paddub     $2, $0, $0
/* 8B438 0018B338 07000010 */  b          .L0018B358
/* 8B43C 0018B33C 00000000 */   nop
.L0018B340:
/* 8B440 0018B340 C0100400 */  sll        $2, $4, 3
/* 8B444 0018B344 21104400 */  addu       $2, $2, $4
/* 8B448 0018B348 00190200 */  sll        $3, $2, 4
/* 8B44C 0018B34C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B450 0018B350 CCD3228C */  lw         $2, -0x2C34($at)
/* 8B454 0018B354 21104300 */  addu       $2, $2, $3
.L0018B358:
/* 8B458 0018B358 0800E003 */  jr         $31
/* 8B45C 0018B35C 00000000 */   nop
