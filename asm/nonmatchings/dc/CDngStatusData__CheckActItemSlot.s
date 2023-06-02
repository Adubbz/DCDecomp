.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckActItemSlot__14CDngStatusDataFi
/* BE560 001BE460 28160070 */  paddub     $2, $0, $0
/* BE564 001BE464 09000010 */  b          .L001BE48C
/* BE568 001BE468 00000000 */   nop
.L001BE46C:
/* BE56C 001BE46C 40180200 */  sll        $3, $2, 1
/* BE570 001BE470 21186400 */  addu       $3, $3, $4
/* BE574 001BE474 62436384 */  lh         $3, 0x4362($3)
/* BE578 001BE478 03006514 */  bne        $3, $5, .L001BE488
/* BE57C 001BE47C 00000000 */   nop
/* BE580 001BE480 06000010 */  b          .L001BE49C
/* BE584 001BE484 00000000 */   nop
.L001BE488:
/* BE588 001BE488 01004224 */  addiu      $2, $2, 0x1
.L001BE48C:
/* BE58C 001BE48C 03004328 */  slti       $3, $2, 0x3
/* BE590 001BE490 F6FF6014 */  bnez       $3, .L001BE46C
/* BE594 001BE494 00000000 */   nop
/* BE598 001BE498 FFFF0224 */  addiu      $2, $0, -0x1
.L001BE49C:
/* BE59C 001BE49C 0800E003 */  jr         $31
/* BE5A0 001BE4A0 00000000 */   nop
/* BE5A4 001BE4A4 00000000 */  nop
/* BE5A8 001BE4A8 00000000 */  nop
/* BE5AC 001BE4AC 00000000 */  nop
