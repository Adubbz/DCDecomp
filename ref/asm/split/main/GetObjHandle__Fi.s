.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetObjHandle__Fi
/* 08A530 0018A430 04008004 */  bltz        $4, .L0018A444
/* 08A534 0018A434 00000000 */   nop
/* 08A538 0018A438 20008228 */  slti        $2, $4, 0x20
/* 08A53C 0018A43C 04004014 */  bnez        $2, .L0018A450
/* 08A540 0018A440 00000000 */   nop
.L0018A444:
/* 08A544 0018A444 28160070 */  paddub      $2, $0, $0
/* 08A548 0018A448 07000010 */  b           .L0018A468
/* 08A54C 0018A44C 00000000 */   nop
.L0018A450:
/* 08A550 0018A450 C0100400 */  sll         $2, $4, 3
/* 08A554 0018A454 23104400 */  subu        $2, $2, $4
/* 08A558 0018A458 C0180200 */  sll         $3, $2, 3
/* 08A55C 0018A45C D401023C */  lui         $2, %hi(ObjHandle)
/* 08A560 0018A460 20D64224 */  addiu       $2, $2, %lo(ObjHandle)
/* 08A564 0018A464 21104300 */  addu        $2, $2, $3
.L0018A468:
/* 08A568 0018A468 0800E003 */  jr          $31
/* 08A56C 0018A46C 00000000 */   nop
