.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckActItemSlot__14CDngStatusDataFi
/* 0BE560 001BE460 28160070 */  paddub      $2, $0, $0
/* 0BE564 001BE464 09000010 */  b           .L001BE48C
/* 0BE568 001BE468 00000000 */   nop
.L001BE46C:
/* 0BE56C 001BE46C 40180200 */  sll         $3, $2, 1
/* 0BE570 001BE470 21186400 */  addu        $3, $3, $4
/* 0BE574 001BE474 62436384 */  lh          $3, 0x4362($3)
/* 0BE578 001BE478 03006514 */  bne         $3, $5, .L001BE488
/* 0BE57C 001BE47C 00000000 */   nop
/* 0BE580 001BE480 06000010 */  b           .L001BE49C
/* 0BE584 001BE484 00000000 */   nop
.L001BE488:
/* 0BE588 001BE488 01004224 */  addiu       $2, $2, 0x1
.L001BE48C:
/* 0BE58C 001BE48C 03004328 */  slti        $3, $2, 0x3
/* 0BE590 001BE490 F6FF6014 */  bnez        $3, .L001BE46C
/* 0BE594 001BE494 00000000 */   nop
/* 0BE598 001BE498 FFFF0224 */  addiu       $2, $0, -0x1
.L001BE49C:
/* 0BE59C 001BE49C 0800E003 */  jr          $31
/* 0BE5A0 001BE4A0 00000000 */   nop
/* 0BE5A4 001BE4A4 00000000 */  nop
/* 0BE5A8 001BE4A8 00000000 */  nop
/* 0BE5AC 001BE4AC 00000000 */  nop
