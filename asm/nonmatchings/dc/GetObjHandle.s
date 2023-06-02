.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetObjHandle__Fi
/* 8A530 0018A430 04008004 */  bltz       $4, .L0018A444
/* 8A534 0018A434 00000000 */   nop
/* 8A538 0018A438 20008228 */  slti       $2, $4, 0x20
/* 8A53C 0018A43C 04004014 */  bnez       $2, .L0018A450
/* 8A540 0018A440 00000000 */   nop
.L0018A444:
/* 8A544 0018A444 28160070 */  paddub     $2, $0, $0
/* 8A548 0018A448 07000010 */  b          .L0018A468
/* 8A54C 0018A44C 00000000 */   nop
.L0018A450:
/* 8A550 0018A450 C0100400 */  sll        $2, $4, 3
/* 8A554 0018A454 23104400 */  subu       $2, $2, $4
/* 8A558 0018A458 C0180200 */  sll        $3, $2, 3
/* 8A55C 0018A45C D401023C */  lui        $2, %hi(ObjHandle)
/* 8A560 0018A460 20D64224 */  addiu      $2, $2, %lo(ObjHandle)
/* 8A564 0018A464 21104300 */  addu       $2, $2, $3
.L0018A468:
/* 8A568 0018A468 0800E003 */  jr         $31
/* 8A56C 0018A46C 00000000 */   nop
